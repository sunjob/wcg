package com.jlj.service;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.jlj.model.Conwaste;
import com.jlj.vo.ConwasteVO;

public interface IConwasteService {

	public abstract void add(Conwaste conwaste) throws Exception;

	public abstract void delete(Conwaste conwaste);

	public abstract void deleteById(int id);

	public abstract void update(Conwaste conwaste);

	@GET
	@Path("/getconwastes")
	@Produces(MediaType.APPLICATION_JSON)
	public abstract List<ConwasteVO> getJsonConwastes();

	@GET
	@Path("/getconwastesbycondition/{param}")
	@Produces(MediaType.APPLICATION_JSON)
	public abstract List<ConwasteVO> getJsonConwastesByCondition(
			@PathParam("param")
			String param);

	public abstract List<Conwaste> getConwastes();

	public abstract Conwaste loadById(int id);

	public abstract int getPageCount(int con, String convalue, int status,
			String publicaccount, int size);

	public abstract int getTotalCount(int con, String convalue, int status,
			String publicaccount);

	public abstract List<Conwaste> queryList(int con, String convalue,
			int status, String publicaccount, int page, int size);

	public abstract List<Conwaste> getConwastesByPublicAccount(String paccount);

	public abstract List<Conwaste> getFrontConwastesByPublicAccount(
			String paccount);

}