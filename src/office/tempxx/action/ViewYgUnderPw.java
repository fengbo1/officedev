package office.tempxx.action;

import java.util.List;

import office.pb2.dao.XxsqPageDAO;
import office.pb2.pojo.XxsqPage;
import office.tempxx.pojo.TPeoplework;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import ccb.hibernate.HibernateSessionFactory;

public class ViewYgUnderPw {
	private static final Log log = LogFactory.getLog(TPeoplework.class);
	
	private List<TPeoplework> list;
	private String title;
	private String name;
	private String begindate;
	private String enddate;
	private String strtemp;
	String peoplename;
	private int zhuan;
	private String[]people;
	private String number;
	private String peoplenametiao;
	private String isdai;
	/**
	* 获得默认的分页大小
	*/

	
	
	
	public String getPeoplename() {
		return peoplename;
	}

	public String getIsdai() {
		return isdai;
	}

	public void setIsdai(String isdai) {
		this.isdai = isdai;
	}

	public String getPeoplenametiao() {
		return peoplenametiao;
	}

	public void setPeoplenametiao(String peoplenametiao) {
		this.peoplenametiao = peoplenametiao;
	}

	public static Log getLog() {
		return log;
	}

	public String[] getPeople() {
		return people;
	}

	public void setPeople(String[] people) {
		this.people = people;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setPeoplename(String peoplename) {
		this.peoplename = peoplename;
	}

	

	public List<TPeoplework> getList() {
		return list;
	}

	public void setList(List<TPeoplework> list) {
		this.list = list;
	}

	public int getZhuan() {
		return zhuan;
	}

	public void setZhuan(int zhuan) {
		this.zhuan = zhuan;
	}

	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getStrtemp() {
		return strtemp;
	}

	public void setStrtemp(String strtemp) {
		this.strtemp = strtemp;
	}


	public String execute() throws Exception
	{
		String result = "success";
		UserInfoDAO uidao = new UserInfoDAO();
		UserInfo ui = new UserInfo();
		XxsqPage xp = new XxsqPage();
		XxsqPageDAO xpdao = new XxsqPageDAO();
		Query query;
		String hql = "";
		String position = "";
		String bd = "";
		String ed = "";
		String un = "";
	    
		
		//title = "统计查询-明细查询";
		Session session = HibernateSessionFactory.getSession();
		Transaction trans = session.beginTransaction();
		try {
			//ui = uidao.findByNewNumber(newnumber);
			//position = ui.getPosition();
			xp = xpdao.findAllByNumber(number);
			people = xp.getPeople().split("、");
			peoplename = "'"+people[0]+"',";
			//peoplenametiao = people[0];	
			for(int i=1;i<people.length;i++)
				{
					peoplename=peoplename+"'"+people[i]+"',";
					//peoplenametiao=peoplenametiao+"、"+people[i];
				}
				peoplename = peoplename.substring(0, peoplename.length()-1);
			   // peoplenametiao = peoplenametiao.substring(0, peoplenametiao.length()-1);
			begindate = xp.getBegindate();
			enddate = xp.getEnddate();
			hql = "from TPeoplework as tw where 1=1 and tw.name in ("+peoplename+")";
			if(name!=null&&zhuan==1)
			{
				strtemp = new String(name.getBytes("ISO8859-1"),"UTF-8");
			}
			else
			{
				strtemp = name;
			}
			
			if((strtemp!=null)&&(!strtemp.equals("")))
			{	
				hql +=" and tw.name = '"+strtemp+"'";
			}
			if(begindate!=null&&!begindate.equals("")&&enddate!=null&&!enddate.equals(""))
			{
				bd = begindate.replace("-","");
				ed = enddate.replace("-", "");
				hql += " and tw.date>='"+bd+"' and tw.date<='"+ed+"'";
			}
		
			
			hql += " order by tw.id";
			System.out.println(hql);
			query = session.createQuery(hql);
			list = query.list();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			trans.commit();
			session.flush();
			session.clear();
			session.close();
		}
		
		return result;
	}
}
