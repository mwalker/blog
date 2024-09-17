---
layout: post
title: Extract Buyee package information to a table
permalink: "/extract-buyee-package-information"
date: '2023-08-05'
tags:
- bookmarklet
- Buyee
- JavaScript
- jq
- jQuery
- Mercari
- programming
- Yahoo Japan Auctions
---

I use [Buyee](https://buyee.jp/) to purchase <s>junk</s> treasures from Japan, primarily from [Mercari](https://buyee.jp/mercari/) and [Yahoo Japan Auctions](https://buyee.jp/yahoo/auction), and I have found the cheapest way to ship things back to Australia is to use their consolidation service to group multiple purchases into the one shipment to me. In the past I have manually looked at each package, opened the "Shipping Information" accordion and made notes on a bit of paper, trying to come up with the optimum combinations of purchases to consolidate to the one package for shipping. Finally I decided to make my life a bit easier and I have whipped up a little JavaScript bookmarklet to extract this info and put it in a table at the top of the page, so I can easily cut and paste it out into Excel to play with.

My jQuery was a bit rusty and it's still a little rough around the edges, but it make accessing this info a lot easier and saves me a bunch of time. Something I discovered is that if you have more than a page of packages (20) there seems to be a Buyee bug where it does not load the dimensions for the extra packages along with the other details. Therefore you need to change the display order and then deal with any duplicates, if you have more than 40 packages then I think you're stuck.

Here it is:

<a href="javascript:(function()%7Bvar%20table%20%3D%20%5B%20%20%22%3Ctable%20id%3D'gunzel'%3E%22%2C%20%20%20%20%22%3Cthead%3E%22%2C%20%20%20%20%20%20%22%3Ctr%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EId%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EDays%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EWeight%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3ELength%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EWidth%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EHeight%3C%2Fth%3E%22%2C%20%20%20%20%20%20%20%20%22%3Cth%3EDescription%3C%2Fth%3E%22%2C%20%20%20%20%20%20%22%3C%2Ftr%3E%22%2C%20%20%20%20%22%3C%2Fthead%3E%22%2C%20%20%20%20%22%3Ctbody%3E%22%5D%3B%24(%22li.luggageInfo%22).each(function(index)%20%7B%20%20var%20id%20%3D%20%24(this).attr('id')%3B%20%20var%20weight%20%3D%20%24(this).find('div.delivery_info_container%20%3E%20div.invoice_info%20%3E%20dl%20%3E%20dd%3Anth-child(6)').text().trim().replace('%2C'%2C%20'').replace(%22g%22%2C%20%22%22)%3B%20%20var%20dimensions%20%3D%20%24(this).find('div.delivery_info_container%20%3E%20div.invoice_info%20%3E%20dl%20%3E%20dd%3Anth-child(8)').text().replace(%22cm%22%2C%20%22%22).replace(%22%20%22%2C%20%22%22).trim()%3B%20%20var%20a%20%3D%20dimensions.split(%22%C3%97%22)%2C%20depth%20%3D%20a%5B0%5D%2C%20width%20%3D%20a%5B1%5D%2C%20height%20%3D%20a%5B2%5D%3B%20%20depth%20%3D%20depth%20%3F%20depth.trim()%20%3A%20''%3B%20%20width%20%3D%20width%20%3F%20width.trim()%20%3A%20''%3B%20%20height%20%3D%20height%20%3F%20height.trim()%20%3A%20''%3B%20%20var%20description%20%3D%20%24(this).find('div.luggageInfo_container%20%3E%20div.luggageInfo_order_wrap.default_order_wrap%20%3E%20table%20%3E%20tbody%20%3E%20tr%3Anth-child(2)%20%3E%20td%3Anth-child(3)').html().trim().replaceAll(%22%20%20%22%2C%20%22%22)%3B%20%20var%20days%20%3D%20%24(this).find('span.storage-remaining-days').text().trim()%3B%20%20table.push(%20%20%20%20%20%20%22%3Ctr%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20id%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20days%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20weight%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20depth%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20width%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20height%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%20%20%22%3Ctd%3E%22%20%2B%20description%20%2B%20%22%3C%2Ftd%3E%22%2C%20%20%20%20%20%20%22%3C%2Ftr%3E%22%20%20)%3B%7D)%3Btable.push(%20%20%20%20%22%3C%2Ftbody%3E%22%2C%20%20%22%3C%2Ftable%3E%22%2C%20%20%22%3Cstyle%20type%3D'text%2Fcss'%3E%22%2C%20%20%20%20%22%23gunzel%20th%2C%20%23gunzel%20td%20%7B%20padding%3A%200%205px%200%205px%3B%20%7D%22%2C%20%20%20%20%22%23gunzel%20td%20%7B%20text-align%3A%20right%3B%20%7D%22%2C%20%20%20%20%22%23gunzel%20%3E%20tbody%20%3E%20tr%20%3E%20td%3Anth-child(7)%20%7B%20text-align%3A%20left%3B%20%7D%22%2C%20%20%22%3C%2Fstyle%3E%22)%3B%24('h1.content_tit').after(table.join(%22%5Cn%22))%3B%7D)()%3B">Buyee Package Extract</a>

And a note on encoding, it seems browsers are pretty forgiving, my initial attempt for instance I manually changed all the quotes into &quot; so it would correctly fit in the href attribute of the a tag. Thinking later I realised it is really a URL, so I think the best way is to URL encode it. Because it has both single and double quotes I was strggling with how to get it into a string to call encodeURI() with, some searching turned up a gist, and in particular this comment by @marfillaster on [using jq to URI encode a string](https://gist.github.com/jaytaylor/5a90c49e0976aadfe0726a847ce58736?permalink_comment_id=4566047#gistcomment-4566047) which I really liked. Using this I could just pipe my source file into jq and not have to query about getting it into a string.

Here is the raw JavaScript:

```javascript
javascript:(function(){
var table = [
  "<table id='gunzel'>",
    "<thead>",
      "<tr>",
        "<th>Id</th>",
        "<th>Days</th>",
        "<th>Weight</th>",
        "<th>Length</th>",
        "<th>Width</th>",
        "<th>Height</th>",
        "<th>Description</th>",
      "</tr>",
    "</thead>",
    "<tbody>"
];
$("li.luggageInfo").each(function(index) {
  var id = $(this).attr('id');
  var weight = $(this).find('div.delivery_info_container > div.invoice_info > dl > dd:nth-child(6)').text().trim().replace(',', '').replace("g", "");
  var dimensions = $(this).find('div.delivery_info_container > div.invoice_info > dl > dd:nth-child(8)').text().replace("cm", "").replace(" ", "").trim();
  var a = dimensions.split("×"), depth = a[0], width = a[1], height = a[2];
  depth = depth ? depth.trim() : '';
  width = width ? width.trim() : '';
  height = height ? height.trim() : '';
  var description = $(this).find('div.luggageInfo_container > div.luggageInfo_order_wrap.default_order_wrap > table > tbody > tr:nth-child(2) > td:nth-child(3)').html().trim();
  var days = $(this).find('span.storage-remaining-days').text().trim();
  table.push(
      "<tr>",
        "<td>" + id + "</td>",
        "<td>" + days + "</td>",
        "<td>" + weight + "</td>",
        "<td>" + depth + "</td>",
        "<td>" + width + "</td>",
        "<td>" + height + "</td>",
        "<td>" + description + "</td>",
      "</tr>"
  );
});
table.push(
    "</tbody>",
  "</table>",
  "<style type='text/css'>",
    "#gunzel th, #gunzel td { padding: 0 5px 0 5px; }",
    "#gunzel td { text-align: right; }",
    "#gunzel > tbody > tr > td:nth-child(7) { text-align: left; }",
  "</style>"
);
$('h1.content_tit').after(table.join("\n"));
})();
```

