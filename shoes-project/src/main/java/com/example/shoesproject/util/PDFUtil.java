package com.example.shoesproject.util;

import com.example.shoesproject.model.Account;
import com.example.shoesproject.model.OrderDetail;
import com.example.shoesproject.model.Orders;
import com.example.shoesproject.model.Product;
import com.example.shoesproject.service.ProductService;
import com.example.shoesproject.service.impl.ProductServiceImpl;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;

import java.net.MalformedURLException;
import java.util.List;

public class PDFUtil {

    private Border borderBottom = new SolidBorder(Color.BLACK, 1f / 2f);
    private float twoCol = 285f;
    private float twoCol150 = twoCol + 150f;
    private float threeCol = 190f;
    private float fourCol = 160f;
    private float[] twoColWidth = {twoCol150, twoCol};
    private float[] fullWidth = {threeCol * 3};
    private float[] fourColWidth = {fourCol, fourCol, fourCol, fourCol};
    private ProductService productService = new ProductServiceImpl();

    public PDFUtil(Orders orders, Account account, List<OrderDetail> orderDetail, PdfWriter pdfWriter) {
        createPDF(orders, account, orderDetail, pdfWriter);
    }

    public void createPDF(Orders orders, Account account, List<OrderDetail> orderDetail, PdfWriter pdfWriter) {
        try {
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            pdfDocument.setDefaultPageSize(PageSize.A4);

            Document document = new Document(pdfDocument);

            Table tableLogo = new Table(twoColWidth);
            document.add(generatedHeader(tableLogo));
            document.add(getBorderAndDivider());
            document.add(generatedInvoice(orders));
            document.add(getHeaderCell("BILLING TO:").setFontSize(18f));
            document.add(generatedShipping(orders, account));
            document.add(getBorderAndDivider());
            document.add(generatedOrder(orderDetail));
            document.add(generatedFooterOrder(orders));

            document.close();
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }

    }

    private Table generatedHeader(Table table) throws MalformedURLException {
        Table nestedTable = new Table(new float[]{twoCol / 2, twoCol / 2});
        nestedTable.setBorder(Border.NO_BORDER);
        nestedTable.addCell(getHeaderCell("INVOICE").setFontSize(30f));
        table.addCell(new Cell().add(nestedTable).setBorder(Border.NO_BORDER));
        return table;
    }

    private Table generatedInvoice(Orders orders) {
        Table nestedTable = baseTable(new float[]{twoCol150 / 2, twoCol150 / 2});
        nestedTable.setMarginTop(15f);
        nestedTable.addCell(getHeaderCell("Invoice No."));
        nestedTable.addCell(getHeaderCellValue(String.valueOf(orders.getId())));
        nestedTable.addCell(getHeaderCell("Invoice Date"));
        nestedTable.addCell(getHeaderCellValue(String.valueOf(orders.getCreateAt())));

        return nestedTable;
    }

    private Table generatedShipping(Orders orders, Account account) {
        Table table = baseTable(new float[]{twoCol150 / 2, twoCol150 / 2});
        table.addCell(getHeaderCell("Full Name"));
        table.addCell(getHeaderCellValue(account.getFullName()));
        table.addCell(getHeaderCellValue(orders.getAddress()));
        return table;
    }

    private Table generatedOrder(List<OrderDetail> orderDetail) {
        Table table = baseTable(fourColWidth);
        table.addCell(getCellOrderHeader("PRODUCT"));
        table.addCell(getCellOrderHeader("PRICE"));
        table.addCell(getCellOrderHeader("QUANTITY"));
        table.addCell(getCellOrderHeader("TOTAL"));

        for (OrderDetail detail : orderDetail) {
            Product product = productService.findById(detail.getProductId());
            table.addCell(getCellOrderValue(product.getName()));
            table.addCell(getCellOrderValue(NumberUtil.formatNumber(detail.getPrice(), detail.getDiscount()) + " VND"));
            table.addCell(getCellOrderValue(String.valueOf(detail.getAmount())));
            table.addCell(getCellOrderValue(NumberUtil.formatNumber(NumberUtil.doubleNumber(detail.getPrice(), detail.getDiscount()) * detail.getAmount()) + " VND"));
        }
        return table;
    }

    private Table generatedFooterOrder(Orders orders) {
        Table table = baseTable(new float[]{threeCol * 2, threeCol});
        table.setMarginTop(15f);
        table.addCell(getFooterCell("Total"));
        table.addCell(getFooterCellValue(NumberUtil.formatNumber(orders.getTotalCost())+ " VND"));

        return table;
    }

    private Table getBorderAndDivider() {
        Table divider = new Table(fullWidth);
        divider.setBorder(borderBottom);
        return divider;
    }

    private Cell getHeaderCell(String textValue) {
        return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    private Cell getHeaderCellValue(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.LEFT);
    }

    private Cell getCellOrderHeader(String textValue) {
        return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setBackgroundColor(Color.BLACK).setFontColor(Color.WHITE).setTextAlignment(TextAlignment.CENTER);
    }

    private Cell getCellOrderValue(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setBorderBottom(borderBottom).setPaddingBottom(10f).setPaddingTop(10f).setTextAlignment(TextAlignment.CENTER);
    }

    private Cell getFooterCell(String textValue) {
        return new Cell().add(textValue).setBold().setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.RIGHT);
    }

    private Cell getFooterCellValue(String textValue) {
        return new Cell().add(textValue).setBorder(Border.NO_BORDER).setTextAlignment(TextAlignment.CENTER);
    }

    private Table baseTable(float[] size) {
        Table table = new Table(size);
        table.setBorder(Border.NO_BORDER);
        table.setMarginBottom(15f);
        return table;
    }
}
