package com.company.garant;


import com.haulmont.thesis.testsupport.ThesisTestContainer;
import org.junit.jupiter.api.extension.ExtensionContext;

public class GarantTestContainer extends ThesisTestContainer {

    public GarantTestContainer() {
        super();
        // project and special properties for test environment.
        appPropertiesFiles.add("garant-app.properties");
        appPropertiesFiles.add("garant-test-app.properties");
        autoConfigureDataSource();
    }

    public static class Common extends GarantTestContainer {

        // A common singleton instance of the test container which is initialized once for all tests
        public static final GarantTestContainer.Common INSTANCE = new GarantTestContainer.Common();

        private static volatile boolean initialized;

        private Common() {}

        @Override
        public void beforeAll(ExtensionContext extensionContext) throws Exception {
            if (!initialized) {
                super.beforeAll(extensionContext);
                initialized = true;
            }
            setupContext();
        }

        @SuppressWarnings("RedundantThrows")
        @Override
        public void afterAll(ExtensionContext extensionContext) throws Exception {
            cleanupContext();
           // never stops - do not call super
        }
    }
}