package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import Scheduler.MyJob;
import Scheduler.SchedulerStart;

@WebServlet("/AjaxSchedulerStartServlet")
public class AjaxSchedulerStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		
		public static Scheduler scheduler = null;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            if (scheduler == null || scheduler.isShutdown()) {
	                startScheduler(); 
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    private void startScheduler() throws SchedulerException {
	        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
	        scheduler = schedulerFactory.getScheduler();

	        JobDetail jobDetail = JobBuilder.newJob(MyJob.class)
	                                        .withIdentity("myJob", "group1")
	                                        .build();

	        CronTrigger cronTrigger = TriggerBuilder.newTrigger()
	                                                .withIdentity("triggerName", "cron_trigger_group")
	                                                .withSchedule(CronScheduleBuilder.cronSchedule("0/20 * * * * ?")) // 매 20초마다 실행
	                                                .forJob(jobDetail)
	                                                .build();

	        scheduler.scheduleJob(jobDetail, cronTrigger);
	        scheduler.start();

	        System.out.println("<<< 포인트 스케줄러가 시작되었습니다. >>>");
	    }
	}
	
