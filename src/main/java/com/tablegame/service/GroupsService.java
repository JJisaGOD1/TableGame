package com.tablegame.service;

import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tablegame.model.bean.group.GroupBean;
import com.tablegame.model.bean.group.ParticipantBean;
import com.tablegame.model.bean.group.ParticipantBeanPK;
import com.tablegame.model.bean.product.Product;
import com.tablegame.model.repository.groups.GroupsRepository;
import com.tablegame.model.repository.groups.ParticipantRepository;



@Service
public class GroupsService {
	@Autowired
	private UserRepository userDao;
	
	@Autowired
	private ProductRepository productDao;
	
	@Autowired
	private GroupsRepository groupsDao;
	
	@Autowired
	private ParticipantRepository participantDao;
	
	public UserBean getUser(int userid) {
		Optional<UserBean> user = userDao.findById(userid);
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
	
	public void insertNewGroup(UserBean launcher, String date, String prodId, String playersNumWithLauncher, String introduction) {
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
		Date gameDate = stringToDate(date);
		return groupsDao.findByGameDate(gameDate);
	}
	
	public void delectGroupById(int groupId, UserBean launcher) {
		
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
		int remainingNum=group.getProduct().getMaxPlayers()-theGroupPlayersNum;
		theGroupNum[0]=theGroupPlayersNum;
		theGroupNum[1]=remainingNum;
		return theGroupNum;
	}
	
	public void insertNewParticipant(UserBean participant, int groupId, int joinPlayersNum) {
		ParticipantBean pb=new ParticipantBean();
		pb.setGroup(groupsDao.getById(groupId));
		pb.setParticipant(participant);
		pb.setParticipantNum(joinPlayersNum);
		participantDao.save(pb);
	}
	
	public Map<Integer, Integer> getGroupsUsersMap(UserBean user, List<GroupBean> groups) {
		var groupsUsersMap = new LinkedHashMap<Integer, Integer>();
		for(GroupBean g:groups) {
			List<ParticipantBean> participants = g.getParticipants();
			for(ParticipantBean p:participants) {
				if(p.getParticipant().getUserId()==user.getUserId()) {
					groupsUsersMap.put(g.getGroupId(),user.getUserId());
					System.out.println(g.getGroupId()+" "+user.getUserId());
				}
			}
		}
		return groupsUsersMap;
	}
	
	public Map<Integer, Integer> getOneJoinedNumMap(UserBean participant, String date) {
		Map<Integer, Integer> oneJoinedNumMap = new LinkedHashMap<Integer,Integer>();
		List<ParticipantBean> participants = participantDao.getOneJoinedNumByDate(participant.getUserId(),date);
		for(ParticipantBean p:participants) {
			oneJoinedNumMap.put(p.getGroup().getGroupId(),p.getParticipantNum());
		}
		return oneJoinedNumMap;
	}
	
	public void quitTheGroup(UserBean participant, int groupId) {
		participantDao.deleteById(new ParticipantBeanPK(groupId, participant.getUserId()));
	}
	
	public void updateParticipantNum(UserBean joiner, int groupId, int updateNum) {
		ParticipantBean pb = participantDao.getById(new ParticipantBeanPK(groupId, joiner.getUserId()));
//		pb.setGroup(groupsDao.getById(groupId));
//		pb.setParticipant(joiner);
		pb.setParticipantNum(updateNum);
		System.out.println(pb.getParticipantNum());
		participantDao.save(pb);
	}
	
	public void updateGroupDate(int groupId, int productId, int updateNum, String updateIntroduction) {
		GroupBean group = groupsDao.getById(groupId);
															//group.getLauncherId()無法找到
		ParticipantBean participant = this.getParticipantById(group.getLauncher().getUserId(), groupId);
		
		group.setIntroduction(updateIntroduction);
		group.setProduct(productDao.getById(productId));
		participant.setParticipantNum(updateNum);
		
		participantDao.save(participant);
		groupsDao.save(group);
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
