package office.zbsp.action;

import java.sql.Timestamp;

import office.zbsp.dao.TZbspPageDAO;
import office.zbsp.dao.TZbspPageDiDAO;
import office.zbsp.pojo.TZbspPage;
import office.zbsp.pojo.TZbspPageDi;
import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.log.dao.OperateLogDAO;
import office.log.pojo.OperateLog;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;
import office.util.DateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ccb.hibernate.HibernateSessionFactory;

public class DeletezbspPage {
	private String message;
	private String number;
	private String newnumber;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getNewnumber() {
		return newnumber;
	}
	public void setNewnumber(String newnumber) {
		this.newnumber = newnumber;
	}
	public String execute() throws Exception
	{
		Session session = HibernateSessionFactory.getSession();
 	    Transaction trans=session.beginTransaction();
 	    
		OperateLogDAO oldao = new OperateLogDAO();
		TZbspPageDAO jpdao = new TZbspPageDAO();
		TZbspPageDiDAO jpddao = new TZbspPageDiDAO();
		OperateLog ol = new OperateLog();
		DateUtil du = new DateUtil();
		LeaveProcessDAO lprodao = new LeaveProcessDAO();
		LeaveProcess lpro = new LeaveProcess();
		//Timestamp time = new Timestamp(System.currentTimeMillis()); 
		UserInfoDAO uidao = new UserInfoDAO();
		UserInfo ui = uidao.findByNewNumber(newnumber);
		TZbspPage jp = jpdao.findAllByNumber(number);
		TZbspPageDi jpd = jpddao.findAllByNumber(newnumber);
		String time = du.getSimpleDateTime();
		message = "撤销成功";
		
		ol.setItem("TZbsp");
		ol.setName(ui.getUsername());
		ol.setNewnumber(newnumber);
		ol.setTime(du.getDateTime());
		ol.setOperate("撤销审批表");
		ol.setRemark(number);
		
		lpro.setAuthority(ui.getAuthority());
		lpro.setNumber(number);
		lpro.setTime(time);
		lpro.setViewer(ui.getUsername());
		lpro.setViewernewnumber(ui.getNewnumber());
		lpro.setRemark("已撤销");
		lpro.setRole("撤销");
		lprodao.merge(lpro);
		oldao.merge(ol);
		
//		String sqljp = "delete from t_TZbsp_page where number='"+number+"'";
//		String sqllpro = "delete from t_leave_process where number='"+number+"'";
//		session.createSQLQuery(sqljp).executeUpdate();
//		session.createSQLQuery(sqllpro).executeUpdate();
		jp.setThisunder("");
		jp.setPreunder("");
		jp.setStatus(6);
		jpdao.merge(jp);
		
		jpd.setDidays(0.0);
		jpd.setJbdays(0.0);
		jpd.setDays(0.0);
		jpddao.merge(jpd);
		
 	    trans.commit();
		session.flush();
		session.clear();
		session.close();
		return "success";
	}
}
