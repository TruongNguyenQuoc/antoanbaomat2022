package com.example.shoesproject.util;

import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.*;
import java.util.Base64;

public class SignatureUser {

    private PublicKey publicKey;
    private PrivateKey privateKey;

    public SignatureUser(){
        try {
            KeyPairGenerator keyGenerator = KeyPairGenerator.getInstance("DSA");
            SecureRandom secureRandom = new SecureRandom();
            keyGenerator.initialize(2048, secureRandom);
            KeyPair keyPair = keyGenerator.generateKeyPair();
            this.publicKey = keyPair.getPublic();
            this.privateKey = keyPair.getPrivate();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean validateMessageSignature(PublicKey publicKey, byte[] message, byte[] signature) throws
            NoSuchAlgorithmException, InvalidKeyException, SignatureException {
        Signature clientSig = Signature.getInstance("DSA");
        clientSig.initVerify(publicKey);
        clientSig.update(message);
        if (clientSig.verify(signature)) {
            return true;
        } else {
            return false;
        }
    }

    public static byte[] signMessage(byte[] message,PrivateKey privateKey) throws NoSuchAlgorithmException,
            InvalidKeyException, SignatureException {
        Signature sig = Signature.getInstance("DSA");
        sig.initSign(privateKey);
        sig.update(message);
        byte[] sign= sig.sign();
        return sign;
    }

    public PublicKey getPublicKey() {
        return publicKey;
    }

    public PrivateKey getPrivateKey() {
        return privateKey;
    }

    public String convertPublicKey(byte[] data){
        return Base64.getEncoder().encodeToString(data);
    }

    public byte[] decode(String data){
        return Base64.getDecoder().decode(data);
    }

    public boolean checkPrivateKey(Part part, Path pathUpload, String publicKey) {
        String docFileKey = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String pathFileUpload = Paths.get(pathUpload.toString(), docFileKey).toString();

        if  (docFileKey.equals("")) return false;

        FileInputStream inputStream = null;
        try {
            part.write(pathFileUpload);
            inputStream = new FileInputStream(pathFileUpload);
            int ch;
            StringBuilder stringBuilder = new StringBuilder();
            while ((ch = inputStream.read()) != -1)
                stringBuilder.append((char) ch);

            return stringBuilder.toString().equals(publicKey);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (inputStream != null)
                    inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
