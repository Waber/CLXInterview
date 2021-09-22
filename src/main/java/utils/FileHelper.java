package utils;

import lombok.SneakyThrows;
import org.apache.commons.io.IOUtils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.stream.Collectors;

public class FileHelper {

    @SneakyThrows
    public static String reader(String filePath) {
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        return reader.lines().collect(Collectors.joining(System.lineSeparator()));
    }
}
