package model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface GenericDAO<T> {
	T doRetriveByKey(Object code) throws SQLException;
	
	ArrayList<T> doRetrieveAll(String order) throws SQLException;
	
	void doSave(T dao) throws SQLException;

	int doUpdate(T dao) throws SQLException;

	boolean doDelete(Object code) throws SQLException;

}