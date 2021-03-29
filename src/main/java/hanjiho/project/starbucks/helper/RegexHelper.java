package hanjiho.project.starbucks.helper;

import java.util.regex.Pattern;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RegexHelper {
	
	/** 주어진 문자열이 공백이거나 null인지를 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 공백, null이 아닐 경우 true 리턴
	 */
	public boolean isValue(String str) {
		boolean result = false;
		//뭐라도 쓰여있으면 이 if문을 거쳐가도록 (null이 아닐경우)를 조건으로 세움.
		//null이면 if문 안거치고 바로 기본값 false가지고 리턴.
		if (str != null) {
			//str.trim().equals("") 자제가 false 혹은 true임.
			//!은 토글기능을 함. 공백이 맞다면(true)를 토글해서 false가 되도록
			result = !str.trim().equals("");
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 빈 문자열이 아닙니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 빈 문자열 입니다.", str));
		}
		return result;
	}
	
	/** 숫자 모양에 대한 형식 검사
	 * @param str - 검사할 문자열
	 * @return  boolean - 형식에 맞으면 true, 맞지않으면 false
	 */
	public boolean isNum(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^[0-9]*$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 숫자 형식이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 숫자 형식이 아닙니다.", str));
		}
		return result;
	}
	
	/** 영문으로만 구성되었는지에 대한 형식 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isEng(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^[a-zA-Z]*$", str);
		}
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 영어로만 구성되어 있습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 영어로만 구성되어 있지 않습니다.", str));
		}
		
		return result;
	}
	
	/** 한글로만 구성되었는지에 대한 형식 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isKor(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 한글로만 구성되어 있습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 한글로만 구성되어 있지 않습니다.", str));
		}
		return result;
	}
	
	/** 영문과 숫자로만 구성되었는지에 대한 형식 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isEngNum(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^[a-zA-Z0-9]*$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 영어와 숫자의 조합이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 영어와 숫자의 조합이 아닙니다.", str));
		}
		return result;
	}
	
	/** 한글과 숫자로만 구성되었는지에 대한 형식 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isKorNum(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^[ㄱ-ㅎ가-힣0-9]*$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 한글과 숫자의 조합이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 한글과 숫자의 조합이 아닙니다.", str));
		}
		return result;
	}
	
	
	/** 이메일 형식인지에 대한 검사
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isEmail(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 이메일 형식이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 이메일 형식이 아닙니다.", str));
		}
		return result;
	}
	
	
	/** "-"없이 핸드폰번호인지에 대한 형식검사.
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isCellPhone(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 핸드폰 번호 형식이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 핸드폰 번호 형식이 아닙니다.", str));
		}
		return result;
	}
	
	
	/** "-"없이 전화번호인지에 대한 형식검사.
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isTel(String str) {
		boolean result = false;
		if (isValue(str)) {
			result = Pattern.matches("^\\d{2,3}\\d{3,4}\\d{4}$", str);
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 전화번호 형식이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 전화번호 형식이 아닙니다.", str));
		}
		return result;
	}
	
	
	/** "-"없이 주민번호에 대한 형식검사.
	 * @param str - 검사할 문자열
	 * @return boolean - 형식에 맞을 경우 true, 맞지 않으면 false
	 */
	public boolean isJumin(String str) {
		boolean result = false;
		
		if (isValue(str)) {
			result = Pattern.matches("^\\d{6}[1-4]\\d{6}", str);
		}
		
		//요부분 좀더 정교한 기능 추가한거임
		if (result) {
			// 각 자리수에 곱해지는 수 배열 구성
			int[] chk = {2,3,4,5,6,7,8,9,2,3,4,5};
			// 총 합
			int total = 0;
			//마지막 자리는 계산에서 제외해야 하므로 반복의 범위에 `-1` 적용
			for (int i=0; i<str.length()-1;i++) {
				total += Integer.parseInt(str.substring(i, i+1)) * chk[i];
			}
			//총 합을 11로 나눈 나머지를 11로 뺀 값을 구한다.
			int value = 11 - (total % 11);
			//결과값이 두 자리라면 10으로 나눈 나머지를 구한다.
			if (value > 9) {
				value %= 10;
			}
			// 최종 결과값이 마지막 자리와 같다면 true, 그렇지 않다면 false
			result = Integer.parseInt(str.substring(str.length()-1)) == value;
		}
		
		if (result) {
			log.debug(String.format("(regex) -> '%s'(은)는 주민번호 형식이 맞습니다.", str));
		} else {
			log.debug(String.format("(regex) -> '%s'(은)는 주민번호 형식이 아닙니다.", str));
		}
		
		return result;
	}
}
