package relx_GradleProject;

import static org.junit.Assert.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;

import org.junit.jupiter.api.Test;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class TestRunner {
	@Test
    public void testParallel() {
        Results results = Runner.path("classpath:Features").tags("@GUI_Test,@API_Test").parallel(2);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }	
}
