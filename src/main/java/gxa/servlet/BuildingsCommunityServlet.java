package gxa.servlet;

import com.alibaba.fastjson.JSON;
import gxa.dto.CommunityInformation;
import gxa.service.CommunityInformationService;
import gxa.service.impl.CommunityInformationServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/page/buildingsInformation/list")
public class BuildingsCommunityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String name=req.getParameter("name");
        System.out.println(name);

        CommunityInformationService communityInformationService = new CommunityInformationServiceImpl();
        List<CommunityInformation> communityInformationList = communityInformationService.queryBuildingName(name);

        String JsonStr = JSON.toJSONString(communityInformationList);

        out.print(JsonStr);
    }
}
