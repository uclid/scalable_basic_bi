import grails.test.AbstractCliTestCase

class IndexTests extends AbstractCliTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testIndex() {

        execute(["index"])

        assertEquals 0, waitForProcess()
        verifyHeader()
    }
}
