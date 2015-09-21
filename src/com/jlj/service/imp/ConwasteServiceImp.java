package com.jlj.service.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.jlj.dao.IConwasteDao;
import com.jlj.model.Conwaste;
import com.jlj.service.IConwasteService;
import com.jlj.vo.ConwasteVO;
@Path("/conwasteService")
public class ConwasteServiceImp implements IConwasteService {
	private IConwasteDao conwasteDao;
	public IConwasteDao getConwasteDao() {
		return conwasteDao;
	}
	@Resource
	public void setConwasteDao(IConwasteDao conwasteDao) {
		this.conwasteDao = conwasteDao;
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#add(com.jlj.model.Conwaste)
	 */
	public void add(Conwaste conwaste) throws Exception {
		conwasteDao.save(conwaste);
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#delete(com.jlj.model.Conwaste)
	 */
	public void delete(Conwaste conwaste) {
		conwasteDao.delete(conwaste);
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#deleteById(int)
	 */
	public void deleteById(int id) {
		conwasteDao.deleteById(id);
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#update(com.jlj.model.Conwaste)
	 */
	public void update(Conwaste conwaste) {
		conwasteDao.update(conwaste);
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getJsonConwastes()
	 */
	@GET
	@Path("/getconwastes")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ConwasteVO> getJsonConwastes() {
		List<ConwasteVO> conwasteVOs= new ArrayList<ConwasteVO>();
		List<Conwaste> Conwastes=conwasteDao.getConwastes();
		for (Conwaste conwaste : Conwastes) {
			ConwasteVO conwasteVO = new ConwasteVO();
			conwasteVO.setId(conwaste.getId());
			conwasteVO.setCarnumber(conwaste.getCarnumber());
			conwasteVO.setLine(conwaste.getLine());
			conwasteVO.setNote(conwaste.getNote());
			conwasteVO.setPerson(conwaste.getNote());
			conwasteVO.setPhone(conwaste.getPhone());
			conwasteVO.setStatus(conwaste.getStatus());
			conwasteVO.setSum(conwaste.getSum());
			conwasteVO.setTimelimit(conwaste.getTimelimit());
			conwasteVO.setUnit(conwaste.getUnit());
			conwasteVO.setForquery(conwaste.getForquery());
			conwasteVOs.add(conwasteVO);
		}
		return conwasteVOs;
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getJsonConwastesByCondition(java.lang.String)
	 */
	@GET
	@Path("/getconwastesbycondition/{param}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ConwasteVO> getJsonConwastesByCondition(@PathParam("param") String param) {
		List<ConwasteVO> conwasteVOs= new ArrayList<ConwasteVO>();
		
		String queryString = "from Conwaste mo where 1=1 ";
		Object[] p = null;
		if(param!=null&&!param.equals("")){
			queryString += "and mo.forquery like ? "; 
			p = new Object[]{'%'+param+'%'};
		}
		queryString += " order by mo.id asc ";
		List<Conwaste> Conwastes=conwasteDao.getObjectsByCondition(queryString, p);
		for (Conwaste conwaste : Conwastes) {
			ConwasteVO conwasteVO = new ConwasteVO();
			conwasteVO.setId(conwaste.getId());
			conwasteVO.setCarnumber(conwaste.getCarnumber());
			conwasteVO.setLine(conwaste.getLine());
			conwasteVO.setNote(conwaste.getNote());
			conwasteVO.setPerson(conwaste.getPerson());
			conwasteVO.setPhone(conwaste.getPhone());
			conwasteVO.setStatus(conwaste.getStatus());
			conwasteVO.setSum(conwaste.getSum());
			conwasteVO.setTimelimit(conwaste.getTimelimit());
			conwasteVO.setUnit(conwaste.getUnit());
			conwasteVO.setForquery(conwaste.getForquery());
			conwasteVOs.add(conwasteVO);
		}
		return conwasteVOs;
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getConwastes()
	 */
	public List<Conwaste> getConwastes() {
		return conwasteDao.getConwastes();
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#loadById(int)
	 */
	public Conwaste loadById(int id) {
		return conwasteDao.loadById(id);
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getPageCount(int, java.lang.String, int, java.lang.String, int)
	 */
	public int getPageCount(int con, String convalue, int status, String publicaccount,
			int size) {
		int totalCount=this.getTotalCount(con, convalue, status, publicaccount);
		return totalCount%size==0?totalCount/size:(totalCount/size+1);
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getTotalCount(int, java.lang.String, int, java.lang.String)
	 */
	public int getTotalCount(int con, String convalue, int status, String publicaccount) {
		String queryString = "select count(*) from Conwaste mo where mo.publicaccount=? ";
		Object[] p = null;
		if(con!=0&&convalue!=null&&!convalue.equals("")){
			//大类别名称
			if(con==1){
				queryString += "and mo.name like ? "; 
			}
			p = new Object[]{publicaccount,'%'+convalue+'%'};
		}else{
			p = new Object[]{publicaccount};
		}
		return conwasteDao.getUniqueResult(queryString,p);
	}

	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#queryList(int, java.lang.String, int, java.lang.String, int, int)
	 */
	public List<Conwaste> queryList(int con, String convalue, int status,
			String publicaccount, int page, int size) {
		String queryString = "from Conwaste mo where mo.publicaccount=? ";
		Object[] p = null;
		if(con!=0&&convalue!=null&&!convalue.equals("")){
			//大类别名称
			if(con==1){
				queryString += "and mo.name like ? "; 
			}
			p = new Object[]{publicaccount,'%'+convalue+'%'};
		}else{
			p = new Object[]{publicaccount};
		}
		queryString += " order by mo.orderid asc ";
		return conwasteDao.pageList(queryString,p,page,size);
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getConwastesByPublicAccount(java.lang.String)
	 */
	public List<Conwaste> getConwastesByPublicAccount(String paccount) {
		String queryString = "from Conwaste mo where mo.publicaccount = ? and mo.islinkonly = 0 order by mo.orderid asc ";
		Object[] p= new Object[]{paccount};
		return conwasteDao.getObjectsByCondition(queryString, p);
	}
	
	/* (non-Javadoc)
	 * @see com.jlj.service.imp.IConwasteService#getFrontConwastesByPublicAccount(java.lang.String)
	 */
	public List<Conwaste> getFrontConwastesByPublicAccount(String paccount) {
		String queryString = "from Conwaste mo where mo.publicaccount = ? and mo.isshow = 1 order by mo.orderid asc ";
		Object[] p= new Object[]{paccount};
		return conwasteDao.getObjectsByCondition(queryString, p);
	}

}
