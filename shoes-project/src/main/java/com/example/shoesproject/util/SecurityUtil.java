package com.example.shoesproject.util;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtil {
    public static String encoderStringToMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(password.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hash = no.toString(16);
            while (hash.length() < 32) {
                hash = "0" + hash;
            }
            return hash;
        }

        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String encryptFile(String sourceFile) {
        try {
            File file = new File(sourceFile);
            byte[] fileBytes = Files.readAllBytes(file.toPath());
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(fileBytes);
            byte[] digest = md.digest();
            BigInteger no = new BigInteger(1, digest);
            String hash = no.toString(16);
            while (hash.length() < 32) {
                hash = "0" + hash;
            }

            return hash;
        } catch (IOException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
