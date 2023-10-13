package validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.phos.entity.Member;
import com.phos.service.MemberService;


@Component
public class memberValidator implements Validator{
	private MemberService memberService;
	
	public memberValidator(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Member member = (Member) target;
		
		if(member.getPassword() == null || member.getPassword().length() < 8  || member.getPassword().length() > 20) {
			errors.rejectValue("password", "range", new Object[] {8L, 20L}, null);
		}
		
		if(memberService.isEmailDuplicated(member.getEmail())) {
			errors.rejectValue("email", "duplicate", new Object[] {}, null);
		}
		
	}
}
