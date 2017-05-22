package vo;

import java.io.Serializable;

public class Customer implements Serializable{
	
	private String name;
	private String email;
	private int age;
	private double weight;
	private boolean marriage;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public boolean isMarriage() {
		return marriage;
	}
	public void setMarriage(boolean marriage) {
		this.marriage = marriage;
	}
	public Customer() {}
	public Customer(String name, String email, int age, double weight, boolean marriage) {
		super();
		this.name = name;
		this.email = email;
		this.age = age;
		this.weight = weight;
		this.marriage = marriage;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + age;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + (marriage ? 1231 : 1237);
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		long temp;
		temp = Double.doubleToLongBits(weight);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Customer other = (Customer) obj;
		if (age != other.age)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (marriage != other.marriage)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (Double.doubleToLongBits(weight) != Double.doubleToLongBits(other.weight))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Customer [name=" + name + ", email=" + email + ", age=" + age + ", weight=" + weight + ", marriage="
				+ marriage + "]";
	}

}
