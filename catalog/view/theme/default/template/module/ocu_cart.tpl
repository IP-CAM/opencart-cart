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

<div class="box">
  <div class="box-heading"><?php echo $this->language->get('heading_title'); ?></div>
  <div class="box-content">
    <div class="ocu-cart">
      <a class="cart-items" onClick="ocuCart();return false;"><?php echo $text_items; ?></a>
      <div class="popup-background"></div>
      <div class="popup-content"></div>
    </div>
  </div>
</div>
