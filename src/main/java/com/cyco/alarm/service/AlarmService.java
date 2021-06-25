package com.cyco.alarm.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cyco.alarm.dao.AlarmDao;
import com.cyco.alarm.vo.AlarmVo;
import com.cyco.alarm.vo.FromNoteVo;
import com.cyco.alarm.vo.ToNoteVo;
import com.cyco.alarm.vo.V_FromNote_Member_Vo;
import com.cyco.alarm.vo.V_ToNote_Member_Vo;

@Repository
public class AlarmService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	//쪽지 보내고 알림 테이블에도 인서트
	@Transactional
	public boolean insertNote(AlarmVo alarm, FromNoteVo frn, ToNoteVo tn ) {

		Boolean bo = false;
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		/*
		 * AlarmVo alarm = (AlarmVo)data.get("alarm"); FromNoteVo frn =
		 * (FromNoteVo)data.get("note"); ToNoteVo tn = (ToNoteVo)data.get("note");
		 */
		System.out.println("frn" + frn);
		System.out.println("alarm" + alarm);
		alarmdao.insertFromNote(frn);
		alarmdao.insertToNote(tn);

		int row = alarmdao.insertAlarm(alarm);

		if (row > 0) {
			bo = true;
		}

		return bo;

	}

	// 쪽지일 경우 위 서비스와 함께 발신, 수신함에도 인서트
	/*
	 * public boolean insertNote(HashMap<String, String> data) {
	 * 
	 * Boolean bo = false;
	 * 
	 * AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class); FromNoteVo frn =
	 * new FromNoteVo(); ToNoteVo tn = new ToNoteVo();
	 * frn.setMEMBER_TO(data.get("member_id"));
	 * frn.setMEMBER_FROM(data.get("sender"));
	 * frn.setNOTE_CONTENT(data.get("message"));
	 * 
	 * System.out.println("발신 : " + frn.toString());
	 * 
	 * tn.setMEMBER_TO(data.get("member_id"));
	 * tn.setMEMBER_FROM(data.get("sender"));
	 * tn.setNOTE_CONTENT(data.get("message")); System.out.println("수신 : " +
	 * frn.toString());
	 * 
	 * int frow = alarmdao.insertFromNote(frn); int nrow =
	 * alarmdao.insertToNote(tn);
	 * 
	 * if(frow > 0 && nrow > 0) { bo = true; }
	 * 
	 * return bo;
	 * 
	 * }
	 */

	// 헤더 알림 메뉴에 최신 알림만 뿌려주기
	public List<AlarmVo> getNewAlarms(String memberid) {

		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<AlarmVo> alarms = alarmdao.getNewAlarms(memberid);

		return alarms;
	}

	// 알림페이지 초기 진입시 전체 알림 뿌려주기
	public List<AlarmVo> getAllAlarms(String useremail) {

		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<AlarmVo> alarms = alarmdao.getAllAlarms(useremail);
		/*
		 * List<AlarmVo> list = alarmdao.getAllAlarms(useremail); List<AlarmVo> alarms =
		 * new ArrayList<AlarmVo>(); int count = 0; for(int i = 0; i < list.size(); i++)
		 * { if(!list.get(i).getALARM_CODE().equals("CAHT_O")) {
		 * alarms.add(list.get(i));
		 * 
		 * } else { count++;
		 * 
		 * if(count == 1) { //회원의 알림테이블에 쪽지 알림이 있을 경우, 쪽지 테이블에서 안 읽은 쪽지 있는지 체크 int
		 * messages = alarmdao.hasNewMessages(useremail);
		 * 
		 * if(messages > 0) { System.out.println("여길 타나"); alarms.add(list.get(i)); }
		 * 
		 * }
		 * 
		 * } }
		 */

		return alarms;
	}

	// 알림 확인시 상태 업데이트
	public Integer checkAlarm(String alarm_id) {

		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int row = alarmdao.checkAlarm(alarm_id);

		return row;

	}

	// 알림 삭제
	public Integer deleteAlarm(String alarm_id) {

		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int row = alarmdao.deleteAlarm(alarm_id);

		return row;

	}

	// 쪽지 페이지 최초 로딩시 수신 메시지 불러오기
	public List<V_ToNote_Member_Vo> getReceivedMessages(String useremail) {
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<V_ToNote_Member_Vo> list = alarmdao.getReceivedMessages(useremail);

		return list;

	}

	// 쪽지 페이지 최초 로딩시 발신 메시지 불러오기
	public List<V_FromNote_Member_Vo> getSendMessages(String useremail) {
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		List<V_FromNote_Member_Vo> list = alarmdao.getSendMessages(useremail);

		return list;

	}

	// 쪽지 읽었을 때 상태 업데이트
	public Boolean updateNoteOk(String noteid) {

		Boolean bo = false;
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int row = alarmdao.updateNoteOk(noteid);

		if (row > 0) {
			bo = true;
		}

		return bo;
	}
}
