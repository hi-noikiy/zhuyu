<?php

//decode by 
if (!defined("IN_IA")) {
	die("Access Denied");
}
class Ewei_DShop_Excel
{
	protected function column_str($_var_0)
	{
		$_var_1 = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK", "AL", "AM", "AN", "AO", "AP", "AQ", "AR", "AS", "AT", "AU", "AV", "AW", "AX", "AY", "AZ", "BA", "BB", "BC", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BK", "BL", "BM", "BN", "BO", "BP", "BQ", "BR", "BS", "BT", "BU", "BV", "BW", "BX", "BY", "BZ", "CA", "CB", "CC", "CD", "CE", "CF", "CG", "CH", "CI", "CJ", "CK", "CL", "CM", "CN", "CO", "CP", "CQ", "CR", "CS", "CT", "CU", "CV", "CW", "CX", "CY", "CZ", "DA", "DB", "DC", "DD", "DE", "DF", "DG", "DH", "DI", "DJ", "DK", "DL", "DM", "DN", "DO", "DP", "DQ", "DR", "DS", "DT", "DU", "DV", "DW", "DX", "DY", "DZ", "EA", "EB", "EC", "ED", "EE", "EF", "EG", "EH", "EI", "EJ", "EK", "EL", "EM", "EN", "EO", "EP", "EQ", "ER", "ES", "ET", "EU", "EV", "EW", "EX", "EY", "EZ");
		return $_var_1[$_var_0];
	}
	protected function column($_var_0, $_var_2 = 1)
	{
		return $this->column_str($_var_0) . $_var_2;
	}
	function export($_var_3, $_var_4 = array())
	{
		if (PHP_SAPI == "cli") {
			die("This example should only be run from a Web Browser");
		}
		require_once IA_ROOT . "/framework/library/phpexcel/PHPExcel.php";
		$_var_5 = new PHPExcel();
		$_var_5->getProperties()->setCreator("人人商城")->setLastModifiedBy("人人商城")->setTitle("Office 2007 XLSX Test Document")->setSubject("Office 2007 XLSX Test Document")->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")->setKeywords("office 2007 openxml php")->setCategory("report file");
		$_var_6 = $_var_5->setActiveSheetIndex(0);
		$_var_7 = 1;
		foreach ($_var_4["columns"] as $_var_0 => $_var_8) {
			$_var_6->setCellValue($this->column($_var_0, $_var_7), $_var_8["title"]);
			if (!empty($_var_8["width"])) {
				$_var_6->getColumnDimension($this->column_str($_var_0))->setWidth($_var_8["width"]);
			}
		}
		$_var_7++;
		$_var_9 = count($_var_4["columns"]);
		foreach ($_var_3 as $_var_10) {
			for ($_var_11 = 0; $_var_11 < $_var_9; $_var_11++) {
				$_var_12 = isset($_var_10[$_var_4["columns"][$_var_11]["field"]]) ? $_var_10[$_var_4["columns"][$_var_11]["field"]] : '';
				$_var_6->setCellValue($this->column($_var_11, $_var_7), $_var_12);
			}
			$_var_7++;
		}
		$_var_5->getActiveSheet()->setTitle($_var_4["title"]);
		$_var_13 = urlencode($_var_4["title"] . "-" . date("Y-m-d H:i", time()));
		header("Content-Type: application/octet-stream");
		header("Content-Disposition: attachment;filename=\"" . $_var_13 . ".xls\"");
		header("Cache-Control: max-age=0");
		$_var_14 = PHPExcel_IOFactory::createWriter($_var_5, "Excel5");
		$_var_14->save("php://output");
		die;
	}
	public function import($_var_15)
	{
		global $_W;
		require_once IA_ROOT . "/framework/library/phpexcel/PHPExcel.php";
		require_once IA_ROOT . "/framework/library/phpexcel/PHPExcel/IOFactory.php";
		require_once IA_ROOT . "/framework/library/phpexcel/PHPExcel/Reader/Excel5.php";
		$_var_16 = IA_ROOT . "/addons/ewei_shop/data/tmp/";
		if (!is_dir($_var_16)) {
			load()->func("file");
			mkdirs($_var_16, "0777");
		}
		$_var_13 = $_FILES[$_var_15]["name"];
		$_var_17 = $_FILES[$_var_15]["tmp_name"];
		if (empty($_var_17)) {
			message("请选择要上传的Excel文件!", '', "error");
		}
		$_var_18 = strtolower(pathinfo($_var_13, PATHINFO_EXTENSION));
		if ($_var_18 != "xlsx" && $_var_18 != "xls") {
			message("请上传 xls 或 xlsx 格式的Excel文件!", '', "error");
		}
		$_var_19 = time() . $_W["uniacid"] . "." . $_var_18;
		$_var_20 = $_var_16 . $_var_19;
		$_var_21 = move_uploaded_file($_var_17, $_var_20);
		if (!$_var_21) {
			message("上传Excel 文件失败, 请重新上传!", '', "error");
		}
		$_var_22 = PHPExcel_IOFactory::createReader($_var_18 == "xls" ? "Excel5" : "Excel2007");
		$_var_5 = $_var_22->load($_var_20);
		$_var_6 = $_var_5->getActiveSheet();
		$_var_23 = $_var_6->getHighestRow();
		$_var_24 = $_var_6->getHighestColumn();
		$_var_25 = PHPExcel_Cell::columnIndexFromString($_var_24);
		$_var_26 = array();
		for ($_var_10 = 2; $_var_10 <= $_var_23; $_var_10++) {
			$_var_27 = array();
			for ($_var_28 = 0; $_var_28 < $_var_25; $_var_28++) {
				$_var_27[] = $_var_6->getCellByColumnAndRow($_var_28, $_var_10)->getValue();
			}
			$_var_26[] = $_var_27;
		}
		return $_var_26;
	}
}