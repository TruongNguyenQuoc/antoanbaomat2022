package com.example.shoesproject.util;

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

}
