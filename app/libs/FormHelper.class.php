<?php
class FormHelper {

	/**
	 * 生成自动填充表单数据，配合formset.js使用
	 *
	 * @param array $array
	 * @return string
	 */
	public static function formSet($array)
	{
		$formset = '';
		if (is_array($array)) {
			foreach ($array as $k=>$v) {
				if (is_array($v)) {
					foreach ($v as $kk=>$vv) {
						$vv=str_ireplace('</script>','<\/script>',$vv);
						$vv = var_export($vv,true);
						$vv = str_replace(array("\r","\n"),array("\\r","\\n"),$vv);
						$formset .= "FormSet(\"{$k}[{$kk}]\",{$vv});\n";
					}
				} else {
					$v=str_ireplace('</script>','<\/script>',$v);
					$v = var_export($v,true);
					$v = str_replace(array("\r","\n"),array("\\r","\\n"),$v);
					$formset .= "FormSet(\"{$k}\",{$v});\n";
				}
			}
			return '<script type="text/javascript">'.$formset.'</script>';
		} else {
			return null;
		}
	}//formSet

	/**
	 * 生成错误提示的JS文件，给指定的HTML元素的innerHTML属性赋值
	 *
	 * @param array $array Model类的validate方法产生的错误信息
	 * @param string $prefix 显示错误信息的HTML元素的id属性的前缀，id值由前缀+表单的name属性构成
	 * @return string 返回完整的JS
	 */
	public static function formError($array,$prefix='e_')
	{
		if (is_array($array)) {
			$r='<script type="text/javascript">';
			foreach ($array as $key=>$val) {
				$key=var_export($prefix.$key,true);
				$val=var_export($val,true);
				$r.="document.getElementById({$key}).innerHTML={$val};\n";
				$r.="document.getElementById({$key}).style.display='block';\n";
			}
			$r.='</script>';

			return $r;
		} else {
			return '';
		}
	}//formError
}

?>