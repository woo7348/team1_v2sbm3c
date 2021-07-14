package dev.mvc.team1_v2sbm3c;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class Team1V2sbm3cApplicationTests {
  @Autowired
  private SqlSessionTemplate sqlSession;
  
  @Test
  public void contextLoads() {
  }

  @Test
  public void testSqlSession() throws Exception{
    System.out.println(sqlSession.toString());
  }

}
