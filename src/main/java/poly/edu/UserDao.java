package poly.edu;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UserDao {
	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");
	public static List<User> ls = new ArrayList();
	
	public List<User> dumData() throws ParseException {
		ls.add(new User("A1", "123", "Nguyen Quang Thang", 18, formatDate.parse("10/12/2022"), false));
		ls.add(new User("A2", "124", "Nguyen Quang Thang", 18, formatDate.parse("10/12/2022"), false));
		ls.add(new User("A3", "125", "Nguyen Quang Thang", 18, formatDate.parse("10/12/2022"), true));
		ls.add(new User("A4", "126", "Nguyen Quang Thang", 18, formatDate.parse("10/12/2022"), true));
		ls.add(new User("A5", "127", "Nguyen Quang Thang", 18, formatDate.parse("10/12/2022"), false));
		return ls;
	}
	
	public List<User> getAll(){
		return ls;
	}
	
	public int insert(User u) {
		ls.add(u);
		return 1;
	}
	
	public int update(User u) {
		for (int i = 0; i < ls.size(); i++) {
			if(ls.get(i).getUsername().equals(u.getUsername())) {
				ls.set(i, u);
				return 1;
			}
		}
		return -1;
	}
	
	public User findByUsername(String username) {
		for(User user : ls) {
			if(user.getUsername().equals(username)) {
				return user;
			}
		}
		return null;
	}
	
	public int save(User user) {
		if(findByUsername(user.getUsername()) != null) {
			update(user);
		}else {
			insert(user);
		}
		return 1;
	}
	
	public int delete(String username) {
		User u = findByUsername(username);
		if(u != null) {
			ls.remove(u);
			return 1;
		}
		return -1;
	}
	
}
