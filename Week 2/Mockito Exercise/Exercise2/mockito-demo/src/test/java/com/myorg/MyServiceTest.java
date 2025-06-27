package com.myorg;

import static org.mockito.Mockito.*;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

public class MyServiceTest {
    @Test
    public void testVerifyInteraction() {
        // Step 1: create mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Step 2: call method
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Step 3: verify interaction
        verify(mockApi).getData();
    }
}
