package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import Scheduler.MyJob;
import Scheduler.SchedulerStart;

@WebServlet("/AjaxSchedulerEndServlet")
public class AjaxSchedulerEndServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       try {
		AjaxSchedulerStartServlet.scheduler.shutdown();
		System.out.println("<<< 포인트 스케줄러의 실행이 종료되었습니다. >>>");
	} catch (SchedulerException e) {
		e.printStackTrace();
	}
    }
}