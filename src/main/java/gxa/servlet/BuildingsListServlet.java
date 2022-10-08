package gxa.servlet;

import com.alibaba.fastjson.JSON;
import gxa.entity.Buildings;
import gxa.entity.House;
import gxa.service.BuildingsService;
import gxa.service.HouseService;
import gxa.service.impl.BuildingsServiceImpl;
import gxa.service.impl.HouseServiceImpl;
import gxa.utils.TableResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet("/page/buildings/list")
public class BuildingsListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String communityName = req.getParameter("communityName");

        Integer page = Integer.valueOf(req.getParameter("page"));

        Integer limit = Integer.valueOf(req.getParameter("limit"));


        BuildingsService buildingsService = new BuildingsServiceImpl();

        Integer count =buildingsService.count(communityName);

        List<Buildings> buildings = buildingsService.queryBuildings(page, limit, communityName);
        TableResult tableResult = new TableResult(0, "suc", count, buildings);
        System.out.println(tableResult);
        String communityJsonStr = JSON.toJSONString(tableResult);

        out.print(communityJsonStr);


    }
}
