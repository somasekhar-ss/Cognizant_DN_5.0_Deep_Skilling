
public class Test {

	public static void main(String [] args) {
		
		// Using Word Document Factory
        DocumentFactory wordFactory = new FactoryWordDocument();
        Document wordDoc = wordFactory.createDocument();
        wordDoc.show();

        // Using PDF Document Factory
        DocumentFactory pdfFactory = new FactoryPdfDocument();
        Document pdfDoc = pdfFactory.createDocument();
        pdfDoc.show();

        // Using Excel Document Factory
        DocumentFactory excelFactory = new FactoryExcelDocument();
        Document excelDoc = excelFactory.createDocument();
        excelDoc.show();
	}
}
