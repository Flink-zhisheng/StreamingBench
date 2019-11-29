package com.intel.streaming_benchmark.utils;

public class threadTest extends Thread{
    long i =0;
    long start = System.currentTimeMillis();
    long length = 0;
    boolean flag = true;
    @Override
    public void run() {
        String name = Thread.currentThread().getName();
        byte[]  bytes;
        while(flag){
            bytes = (i + "_" + name + ",").getBytes();
            length = length + bytes.length;
            i++;
            if(System.currentTimeMillis() - start > 10000){
                flag = false;
                System.out.println(i + "   " + length);
            }
        }

    }
}
