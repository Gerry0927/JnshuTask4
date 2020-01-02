
import com.gerry.jnshu.mapper.ProfessionMapper;
import com.gerry.jnshu.pojo.ExcellentStudent;
import com.gerry.jnshu.pojo.Profession;
import com.gerry.jnshu.service.ExcellentStudentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.beans.PropertyEditor;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext.xml")
public class AppTest {


    @Resource
    ExcellentStudentService commentService;
    @Test
    public void getBannerInfos(){
//        List<Profession> bannerInfos = commentService.getProInfos("后端开发方向");
//        for (Profession info : bannerInfos) {
//            System.out.println(info);
//        }

//        for (String type : commentService.getProTypes()) {
//            System.out.println(type);
//        }

        List<ExcellentStudent> excellentStuInfos = commentService.getExcellentStuInfos();
        for (ExcellentStudent info : excellentStuInfos) {
            System.out.println(info);
        }
    }



}