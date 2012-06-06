<?php

/**
 * OpenCart Ukrainian Community
 *
 * LICENSE
 *
 * This source file is subject to the GNU General Public License, Version 3
 * It is also available through the world-wide-web at this URL:
 * http://www.gnu.org/copyleft/gpl.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@opencart.ua so we can send you a copy immediately.
 *
 * @category   OpenCart
 * @package    OCU Cart
 * @copyright  Copyright (c) 2011 Eugene Kuligin by OpenCart Ukrainian Community (http://www.opencart.ua)
 * @license    http://www.gnu.org/copyleft/gpl.html     GNU General Public License, Version 3
 */

?>

<div class="header">
  <span><?php echo $this->language->get('heading_title'); ?></span>
  <a class="close-popup"></a>
</div>

<?php if ($products || $vouchers) { ?>

<table class="cart">
  <?php $qty = 0; ?>
<tr class="tr-header">
  <td colspan="3"><?php echo $this->language->get('text_product'); ?></td>
  <td><?php echo $this->language->get('text_qty'); ?></td>
  <td class="th-total"><?php echo $this->language->get('column_total'); ?></td>
</tr>
  <?php foreach ($products as $product) { ?>
  <?php $qty = $qty+$product['quantity']; ?>

  <tr>
    <td class="remove"><img src="catalog/view/theme/default/image/ocu-remove-product.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="removeCart('<?php echo $product['key']; ?>');" /></td>
    <td class="image"><?php if ($product['thumb']) { ?>
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
      <?php } ?></td>
    <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
      <div>
        <?php foreach ($product['option'] as $option) { ?>
        - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
        <?php } ?>
      </div></td>
    <td class="quantity"><input name="quantity[<?php echo $product['key']; ?>]" type="text" value="<?php echo $product['quantity']; ?>" size="1" /> <span class="qty"><?php echo $text_qty_items; ?></span></td>
    <td class="total"><b><?php echo $product['total']; ?></b></td>
  </tr>
  <?php } ?>
  <?php foreach ($vouchers as $voucher) { ?>
  <tr>
    <td class="remove"><img src="catalog/view/theme/default/image/ocu-remove-product.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="removeVoucher('<?php echo $voucher['key']; ?>');" /></td>
    <td class="image"></td>
    <td class="name"><?php echo $voucher['description']; ?></td>
    <td class="quantity">x&nbsp;1</td>
    <td class="total"><?php echo $voucher['amount']; ?></td>
  </tr>
  <?php } ?>
</table>

<div class="cart-footer">
<table class="total">
  <?php $total_uah = 0; ?>
  <?php foreach ($totals as $total) { ?>
  <?php $total_html = '<tr><td class="checkout"><a href="'. $checkout.'" class="button"><span>'.$button_checkout.'</span></a></td><td class="continue"><a>'.$this->language->get('text_continue').'</a></td><td class="total">'.$total['title'].' '.$total['text'].'</td></tr>'; ?>
  <?php $total_uah = ($total['text']) ? $total['text'] : false; ?>
  <?php } ?>
  <?php echo $total_html; ?>
</table>
<?php
  $cases = array (2, 0, 1, 1, 1, 2);
  $language_form =  (((($qty % 100) > 4 && ($qty % 100) < 20) ? 2 : $cases[min($qty % 10, 5)])+1);
?>
</div>
<script type="text/javascript"><!--

$('.ocu-cart .popup-content').prepend('<div class="cart-total-items"><?php echo sprintf(${'text_cart_total_'.$language_form},$qty,$total_uah); ?></div>');

$('.close-popup, .continue').bind('click', function() {
  $('.ocu-cart .popup-content, .ocu-cart .popup-background').removeClass('active');
});

$(document).keypress(function(e) {
  if(e.keyCode == 13) {
    updateCart();
  }
});

$('.ocu-cart input, .ocu-cart .popup-content input').focusout(function() {
  updateCart();
});

//--></script>
<?php } else { ?>
<div class="empty"><?php echo $text_empty; ?></div>
<?php } ?>

<script type="text/javascript"><!--
$('.ocu-cart .close-popup').bind('click', function() {
  $('.ocu-cart .popup-content, .ocu-cart .popup-background').removeClass('active');
});
//--></script>
