package cn.model;

import java.util.ArrayList;
import java.util.List;

public class ChangeResource {
	private String resource;
	private List<ChangeData> list = new ArrayList<>();
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public List<ChangeData> getList() {
		return list;
	}
	public void setList(List<ChangeData> list) {
		this.list = list;
	}
	
}
