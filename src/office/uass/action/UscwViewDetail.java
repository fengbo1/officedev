package office.uass.action;

import java.util.List;

import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.uass.dao.UassCostHnDAO;
import office.uass.dao.UassCostHnPeopleDAO;
import office.uass.dao.UassCostWbDAO;
import office.uass.pojo.UassCostHn;
import office.uass.pojo.UassCostHnPeople;
import office.uass.pojo.UassCostWb;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ccb.hibernate.HibernateSessionFactory;

public class UscwViewDetail {
	private String number;
	private String newnumber;
	private UassCostWb uc;
	private List<LeaveProcess> listlp;
	private UserInfo ui;
	private String position;
	private int queren;
	
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
	public List<LeaveProcess> getListlp() {
		return listlp;
	}

	public void setListlp(List<LeaveProcess> listlp) {
		this.listlp = listlp;
	}

	public UserInfo getUi() {
		return ui;
	}

	public void setUi(UserInfo ui) {
		this.ui = ui;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public UassCostWb getUc() {
		return uc;
	}

	public void setUc(UassCostWb uc) {
		this.uc = uc;
	}

	public int getQueren() {
		return queren;
	}

	public void setQueren(int queren) {
		this.queren = queren;
	}

	public String execute() throws Exception {
		UassCostWbDAO ucdao = new UassCostWbDAO();
		LeaveProcessDAO lpdao = new LeaveProcessDAO();
		UserInfoDAO uidao = new  UserInfoDAO();
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		uc = ucdao.findAllByNumber(number);
		listlp = lpdao.findAllByNumber(number);
		ui = uidao.findByNewNumber(uc.getInitiator());
		position = ui.getPosition();
		trans.commit();
		session.flush();
		session.clear();
		session.close();
		return "success";
	}
}
