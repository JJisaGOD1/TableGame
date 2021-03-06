package com.tablegame.service.groups;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tablegame.dto.ChangeTheGroupInfoDto;
import com.tablegame.dto.ParticipantsDto;
import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.group.ParticipantBeanPK;
import com.tablegame.model.bean.member.MembersBean;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.groups.GroupsRepository;
import com.tablegame.model.repository.groups.ParticipantRepository;
import com.tablegame.model.repository.member.MembersRepository;
import com.tablegame.model.repository.product.ProductRepository;



@Service
public class GroupsService {
	@Autowired
	private MembersRepository userDao;
	
	@Autowired
	private ProductRepository productDao;
	
	@Autowired
	private GroupsRepository groupsDao;
	
	@Autowired
	private ParticipantRepository participantDao;
	
	public MembersBean getUser(int userid) {
		Optional<MembersBean> user = userDao.findById(userid);
		if(user.isPresent()) {
			return user.get();
		}
		return null;
	}
	
	public List<Product> getAllProductBean() {
		List<Product> allProds = productDao.findAll();
		return allProds;
	}
	
	public Product getProductBean(int prodId) {
		Product Prod = productDao.getById(prodId);
		return Prod;
	}
	
	public void insertNewGroup(MembersBean launcher, String date, String prodId, String playersNumWithLauncher, String introduction) {
		//
		Date gameDate = stringToDate(date);
		
		//
		int productId = Integer.parseInt(prodId);
		Product product = productDao.getById(productId);
		
		//
		int initPlayersNum = Integer.parseInt(playersNumWithLauncher);
		
		//
		GroupBean gb = new GroupBean();
		gb.setLauncher(launcher);
		gb.setProduct(product);
		gb.setGameDate(gameDate);
		gb.setIntroduction(introduction);
		groupsDao.save(gb);
		
		ParticipantBean pb = new ParticipantBean();
		GroupBean newgb = groupsDao.findFirstByOrderByCreatedTimeDesc();
		pb.setGroup(newgb);
		pb.setParticipant(launcher);
		pb.setParticipantNum(initPlayersNum);
		pb.setJoinedTime(newgb.getCreatedTime());
		participantDao.save(pb);
	}

	public List<GroupBean> getGroupsByDate(String date) {
//		Date gameDate = stringToDate(date);
		System.out.println("Ssssssssssssssssssssssssssss");
		System.out.println("date="+date);
//		System.out.println("gameDate="+gameDate);
		System.out.println(groupsDao.getByGameDate2(date));
		return groupsDao.getByGameDate2(date);
	}
	
	public void delectGroupById(int groupId) {
		
//		var participantId=new ParticipantBeanPK(groupId,launcher.getUserId());
		GroupBean group = groupsDao.getById(groupId);
		participantDao.deleteByGroup(group);
		groupsDao.deleteById(groupId);
	}
	
	public Map<Integer, Integer> getPlayerNumMapByDate(String date) {
		Map<Integer, Integer> perGroupNumMap = new LinkedHashMap<Integer, Integer>();
		List<GroupBean> groups = this.getGroupsByDate(date);
		
		for(GroupBean g:groups) {
			int playerNumInTheGroup=0;
			List<ParticipantBean> participants = g.getParticipants();
			for(ParticipantBean p:participants) {
				playerNumInTheGroup+=p.getParticipantNum();
			}
			perGroupNumMap.put(g.getGroupId(),playerNumInTheGroup);
		}
		return perGroupNumMap;
	}
	
	public Map<Integer, Integer> getAllPlayerNumMap() {
		Map<Integer, Integer> perGroupNumMap = new LinkedHashMap<Integer, Integer>();
		List<GroupBean> groups = groupsDao.findAll();
		
		for(GroupBean g:groups) {
			int playerNumInTheGroup=0;
			List<ParticipantBean> participants = g.getParticipants();
			for(ParticipantBean p:participants) {
				playerNumInTheGroup+=p.getParticipantNum();
			}
			perGroupNumMap.put(g.getGroupId(),playerNumInTheGroup);
		}
		return perGroupNumMap;
	}
	
	public ParticipantBean getParticipantById(int participantId, int groupId) {
		return participantDao.getById(new ParticipantBeanPK(groupId, participantId));
	}
	
	public GroupBean getGroupsById(int groupId) {
		return groupsDao.getById(groupId);
	}
	
	public int[] getTheGroupNum(int groupId) {
		int[] theGroupNum=new int[2];
		GroupBean group = this.getGroupsById(groupId);
		List<ParticipantBean> participants = group.getParticipants();
		int theGroupPlayersNum=0;
		for(ParticipantBean p:participants) {
			theGroupPlayersNum+=p.getParticipantNum();
		}
		int remainingNum=group.getProduct().getMaxplayer()-theGroupPlayersNum;
		theGroupNum[0]=theGroupPlayersNum;
		theGroupNum[1]=remainingNum;
		return theGroupNum;
	}
	
	public void insertNewParticipant(MembersBean participant, int groupId, int joinPlayersNum) {
		ParticipantBean pb=new ParticipantBean();
		pb.setGroup(groupsDao.getById(groupId));
		pb.setParticipant(participant);
		pb.setParticipantNum(joinPlayersNum);
		participantDao.save(pb);
	}
	
	public Map<Integer, Integer> getGroupsUsersMap(MembersBean user, List<GroupBean> groups) {
		var groupsUsersMap = new LinkedHashMap<Integer, Integer>();
		for(GroupBean g:groups) {
			List<ParticipantBean> participants = g.getParticipants();
			for(ParticipantBean p:participants) {
				if(p.getParticipant().getId()==user.getId()) {
					groupsUsersMap.put(g.getGroupId(),user.getId());
					System.out.println(g.getGroupId()+" "+user.getId());
				}
			}
		}
		return groupsUsersMap;
	}
	
	public Map<Integer, Integer> getOneJoinedNumMap(MembersBean participant, String date) {
		Map<Integer, Integer> oneJoinedNumMap = new LinkedHashMap<Integer,Integer>();
		List<ParticipantBean> participants = participantDao.getOneJoinedNumByDate(participant.getId(),date);
		for(ParticipantBean p:participants) {
			oneJoinedNumMap.put(p.getGroup().getGroupId(),p.getParticipantNum());
		}
		return oneJoinedNumMap;
	}
	
	public void quitTheGroup(MembersBean participant, int groupId) {
		participantDao.deleteById(new ParticipantBeanPK(groupId, participant.getId()));
	}
	
	public void updateParticipantNum(MembersBean joiner, int groupId, int updateNum) {
		ParticipantBean pb = participantDao.getById(new ParticipantBeanPK(groupId, joiner.getId()));
//		pb.setGroup(groupsDao.getById(groupId));
//		pb.setParticipant(joiner);
		pb.setParticipantNum(updateNum);
		System.out.println(pb.getParticipantNum());
		participantDao.save(pb);
	}
	
	public void updateGroupDate(int groupId, int productId, int updateNum, String updateIntroduction) {
		GroupBean group = groupsDao.getById(groupId);
															//group.getLauncherId()????????????
		ParticipantBean participant = this.getParticipantById(group.getLauncher().getId(), groupId);
		
		group.setIntroduction(updateIntroduction);
		group.setProduct(productDao.getById(productId));
		participant.setParticipantNum(updateNum);
		
		participantDao.save(participant);
		groupsDao.save(group);
	}
	
	public List<GroupBean> getAllGroups(){
		return groupsDao.findAll();
	}
	
	public List<ParticipantBean> getParticipantByGroupId(int groupId) {
		return participantDao.getByGroup(groupsDao.getById(groupId));
	}
	
	public List<ParticipantsDto> getParticipantsDtoByGroupId(int groupId){
		List<ParticipantBean> participants = participantDao.getByGroup(groupsDao.getById(groupId));
		List<ParticipantsDto> participantsInfo=new ArrayList<ParticipantsDto>();
		for(ParticipantBean p:participants) {
			MembersBean mem=userDao.getById(p.getId().getParticipantId());
			ParticipantsDto pdto=new ParticipantsDto(p, mem);
			participantsInfo.add(pdto);
		}
		return participantsInfo;
	}
	
	//for this.changeTheGroupInfo()
	public void updateTheGroupGame(int groupId,int prodId) {
		GroupBean group = groupsDao.getById(groupId);
		group.setProductId(prodId);
		group.setProduct(productDao.getById(prodId));
		groupsDao.save(group);
	}
	//??????????????????????????????
	public void changeTheGroupInfo(ChangeTheGroupInfoDto json) {
		HashMap<Integer, Integer> numOfparticipants = json.getNumOfparticipants();
		for(Map.Entry<Integer, Integer> entry:numOfparticipants.entrySet()) {
			System.out.println("userid:"+entry.getKey()+" num:"+entry.getValue());
			this.updateParticipantNum(
					userDao.getById(entry.getKey())
					,json.getGroupId()
					,entry.getValue());
		}
		this.updateTheGroupGame(json.getGroupId(), json.getProdId());
	}
	
	
	//static
	private static Date stringToDate(String stringDate) {
		String[] ymd = stringDate.split("/");
		int[] ymdInt=new int[3];
		for(int i=0;i<=2;i++) {
			int a=Integer.parseInt(ymd[i]);
			ymdInt[i]=a;
		}
		Calendar c=Calendar.getInstance();
		c.set(ymdInt[0], ymdInt[1]-1, ymdInt[2]);
		Date dateDate=c.getTime();
		return dateDate;
	}


	
	

}
