package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate jsonAPITest() {
		return Karate.run("json").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate getAPITest() {
		return Karate.run("getapi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate getAPIWithQueryTest() {
		return Karate.run("getapiwithquery").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate headersTest() {
		return Karate.run("headers").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate authTokenTest() {
		return Karate.run("authToken").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate postAPITest() {
		return Karate.run("postapi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate randomEmailTest() {
		return Karate.run("randomEmail").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate postjsonFileTest() {
		return Karate.run("postjsonfile").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate putAPITest() {
		return Karate.run("putapi").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate updateUserTest() {
		return Karate.run("updateuser").relativeTo(getClass());
	}
	
	@Karate.Test
	Karate deleteAPITest() {
		return Karate.run("deleteapi").relativeTo(getClass());
	}
}
