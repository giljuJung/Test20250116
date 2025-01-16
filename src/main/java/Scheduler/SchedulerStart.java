package Scheduler;

import java.util.HashSet;
import java.util.Set;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class SchedulerStart {
	static Scheduler scheduler = null;
	public static void main(String[] args) {
		 try {
	            SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	            scheduler = schedulerFactory.getScheduler();

	            JobDetail jobDetail = JobBuilder.newJob(MyJob.class)
	                                    .withIdentity("myJob", "group1")
	                                    .build();

	            CronTrigger cronTrigger = (CronTrigger) TriggerBuilder.newTrigger()
	                                    .withIdentity("trggerName", "cron_trigger_group")
	                                    .withSchedule(CronScheduleBuilder.cronSchedule("0/20 * * * * ?")) // 매 20초마다 실행
	                                    .forJob(jobDetail)
	                                    .build();

	            Set<Trigger> triggerSet = new HashSet<Trigger>();
	            triggerSet.add(cronTrigger);

	            scheduler.scheduleJob(jobDetail, triggerSet, false);

	            scheduler.start();
	            System.out.println("<<< 포인트 스케줄러가 시작되었습니다. >>>");
	        } catch(Exception e) {
	            e.printStackTrace();
	        }        
	}
}
