package com.myorg;

import static org.mockito.Mockito.*;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.mockito.Mockito;

public class MyServiceTest {
    @Test
    public void testExternalApi() {
        // Step 1: Mock
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Step 2: Stub
        when(mockApi.getData()).thenReturn("Mock Data");

        // Step 3: Use service with mock
        MyService service = new MyService(mockApi);
        String result = service.fetchData();

        // Step 4: Assert
        assertEquals("Mock Data", result);
    }
}
