package office.jbsp.action;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ccb.hibernate.HibernateSessionFactory;

import office.jbsp.dao.JbspPageDAO;
import office.jbsp.pojo.JbspPage;
import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.process.action.FindNextUnder;
import office.process.dao.ProcessDAO;
import office.process.pojo.Process;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;
import office.util.DateUtil;
import office.wcgg.dao.WcggBaodaoDAO;
import office.wcgg.dao.WcggPageDAO;
import office.wcgg.pojo.WcggBaodao;
import office.wcgg.pojo.WcggPage;

public class ViewJbspUnderDetail {
	private String number;
	private String undersign;
	private JbspPage jp;
	private List<LeaveProcess> listlp;
	private List<UserInfo> listui;
	private int youshenpi;
	private String position;
	private String begindate;
	private String enddate;
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getUndersign() {
		return undersign;
	}

	public void setUndersign(String undersign) {
		this.undersign = undersign;
	}
	public JbspPage getJp() {
		return jp;
	}

	public void setJp(JbspPage jp) {
		this.jp = jp;
	}

	public List<LeaveProcess> getListlp() {
		return listlp;
	}

	public void setListlp(List<LeaveProcess> listlp) {
		this.listlp = listlp;
	}

	public List<UserInfo> getListui() {
		return listui;
	}

	public void setListui(List<UserInfo> listui) {
		this.listui = listui;
	}

	public int getYoushenpi() {
		return youshenpi;
	}

	public void setYoushenpi(int youshenpi) {
		this.youshenpi = youshenpi;
	}
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getBegindate() {
		return begindate;
	}

	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String execute() throws Exception {
		DateUtil du = new DateUtil();
		JbspPageDAO jpdao = new JbspPageDAO();
		LeaveProcessDAO lpdao = new LeaveProcessDAO();
		FindNextUnder fnu = new FindNextUnder();
		ProcessDAO pdao = new ProcessDAO();
		UserInfoDAO uidao = new  UserInfoDAO();
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		
		jp = jpdao.findAllByNumber(number);
		listlp = lpdao.findAllByNumber(number);
		listui = fnu.findNextUnder("JBSP", number);
		UserInfo ui = uidao.findByNewNumber(jp.getApplicant());
		position = ui.getPosition();
		Process p = pdao.findByItemAndApplicant("JBSP", jp.getProcess());
		
		int jindulength = jp.getJindu().length();
		String proc = p.getProcess();

		undersign = proc.substring(jindulength, jindulength + 1);

		if (listui.isEmpty()) {
			youshenpi = 0;
		} else {
			youshenpi = 1;
		}
		begindate=du.simpleToStanderd(jp.getBegindate());
	    enddate=du.simpleToStanderd(jp.getEnddate());
		trans.commit();
		session.flush();
		session.clear();
		session.close();
		return "success";
	}
}
