package atividade1;

import java.nio.file.Paths;
import java.io.FileReader;
import java.io.IOException;

public class Analyzer {
	public static void main(String[] args) throws IOException {
		String rootPath = Paths.get("").toAbsolutePath().toString();
		System.out.println(rootPath);
		String subPath = "/src/test/resources/";
		
		String fileName = "QuickSort.java";
		
		String path = String.format("%s%s%s", rootPath, subPath, fileName);
	
		Minijava mj = new Minijava(new FileReader(path));
		
		while (mj.yylex() != -1) {
			
		}
		
	}
}

