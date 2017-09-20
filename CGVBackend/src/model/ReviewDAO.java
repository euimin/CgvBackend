package model;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class ReviewDAO {

	private static SqlSessionFactory sqlMapper;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis/Configuration.xml");
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private SqlSession session=sqlMapper.openSession();
	
	public List<ReviewDto> selectList(Map map) throws Exception {
		System.out.println("searchColumn:"+map.get("searchColumn"));
		List<ReviewDto> list=session.selectList("ReviewList",map);
		session.close();
		return list;
	}
	
	public ReviewDto selectOne(String no) throws Exception{
		ReviewDto dto=session.selectOne("ReviewOne",no);
		session.close();
		return dto;
	}
	
	public int update(ReviewDto dto) {
		int affected=session.update("ReviewUpdate",dto);
		session.commit();
		session.close();
		return affected;
	}

	public int delete(String no) {
		int affected=session.delete("ReviewDelete",no);
		session.commit();
		session.close();
		return affected;
	}
	
	public int checkDelete(ArrayList<String> checkedNo) {
		int affected=session.delete("ReviewCheckedDelete",checkedNo);
		session.commit();
		session.close();
		return affected;
	}
	
	public int getTotalRecordCount(Map map) {
		int totalRecordCount=session.selectOne("ReviewTotal",map);
		//session.close();
		return totalRecordCount;
	}

	public void close() throws Exception {}


}
