package com.kdn.model.biz;

import java.util.List;

import com.kdn.model.domain.Suyo;

public interface SuyoService {
	public void add(Suyo suyo);
	public void minus(Suyo suyo);
	public Suyo searchSuyo(Suyo suyo);
	public int getSuyoCount(Suyo suyo);
	public List<Suyo> getSuyoCountAll();
}
