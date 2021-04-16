package hanjiho.project.starbucks.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hanjiho.project.starbucks.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SimpleScheduler {
	@Autowired
	MemberService memberService;
	
	public void everyMidnight() throws Exception {
		log.debug("매일 자정에 실행되는 작업 >> " + memberService.deleteMember());
	}
}