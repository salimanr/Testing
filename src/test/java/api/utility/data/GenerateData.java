package api.utility.data;

import java.util.Random;

public class GenerateData {

	public static String getEmail() {
		String prefix = "test_email";
		String provider = "@gmail.com";
		// test_email12345@gmail.com

		int random = (int) (Math.random() * 10000);
		String email = prefix + random + provider;
		return email;

	}

	public static String getPhoneNumber() {
        Random random = new Random();
        StringBuilder phoneNumber = new StringBuilder();

        for (int i = 0; i < 9; i++) {
            int digit = random.nextInt(9);
            phoneNumber.append(digit);
        }

        return "2" + phoneNumber.toString();
	    }
	
		
		/*
		 * public static void main(String[] args) { String phoneNumber =
		 * getPhoneNumber(); System.out.println("Random Phone Number: " + phoneNumber);
		 * }
		 */

	/*
	 * public static void main (String [] args) { GenerateData data = new
	 * GenerateData(); System.out.println(data.getEmail());
	 * 
	 * }
	 */
}
