package Scheduler;

import java.time.LocalTime;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dao.MemberDao;

public class MyJob implements Job {
    @Override
    public void execute(JobExecutionContext ctx) throws JobExecutionException {
    	MemberDao dao = new MemberDao();
    	try {
			int updateRows = dao.SchedulerPlusPoint();
			System.out.println("Job이 실행됨 : "+LocalTime.now() + "/ "+updateRows+"명에게 포인트 부여(1점).");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}