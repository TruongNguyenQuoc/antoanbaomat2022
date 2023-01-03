package com.example.shoesproject.util;

import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class SignatureUser {

    private PublicKey publicKey;
    private PrivateKey privateKey;

    public SignatureUser(){
        try {
            KeyPairGenerator keyGenerator = KeyPairGenerator.getInstance("DSA");
            SecureRandom secureRandom = new SecureRandom();
            keyGenerator.initialize(1024, secureRandom);
            KeyPair keyPair = keyGenerator.generateKeyPair();
            this.publicKey = keyPair.getPublic();
            this.privateKey = keyPair.getPrivate();
        } catch (NoSuchAlgorithmException e) {
        }
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

            KeyFactory keyFactory = KeyFactory.getInstance("DSA");
            PrivateKey prvKey = convertStringToPrivateKey(stringBuilder.toString(), keyFactory);
            PublicKey pubKey = convertStringToPubicKey(publicKey, keyFactory);

            return validatorSignature(prvKey, pubKey);
        } catch (IOException | NoSuchAlgorithmException e) {
            return false;
        } finally {
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean validatorSignature(PrivateKey privateKey, PublicKey publicKey) {
        Signature signature, clientSignature;
        String message = "check your signature";
        try {
            signature = Signature.getInstance("DSA");
            clientSignature = Signature.getInstance("DSA");

            // signature
            signature.initSign(privateKey);
            signature.update(message.getBytes());
            byte[] sign = signature.sign();
            // client signature
            clientSignature.initVerify(publicKey);
            clientSignature.update(message.getBytes());

            return clientSignature.verify(sign);
        } catch (NoSuchAlgorithmException | SignatureException | InvalidKeyException e) {
           return false;
        }
    }

    public PublicKey convertStringToPubicKey(String publicKey, KeyFactory keyFactory) {
        X509EncodedKeySpec keySpecX509 = new X509EncodedKeySpec(Base64.getDecoder().decode(publicKey));
        try {
            return keyFactory.generatePublic(keySpecX509);
        } catch (InvalidKeySpecException e) {
            return null;
        }
    }

    public PrivateKey convertStringToPrivateKey(String privateKey, KeyFactory keyFactory) {
        PKCS8EncodedKeySpec keySpecPKCS8 = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(privateKey));

        try {
            return keyFactory.generatePrivate(keySpecPKCS8);
        } catch (InvalidKeySpecException e) {
            return null;
        }
    }

}
