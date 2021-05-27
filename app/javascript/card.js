const pay = () => {
  Payjp.setPublicKey("pk_test_dfe59fbfa0b6906719e22ac7"); 
  const form = document.getElementById("charge-form"); 
  form.addEventListener("submit", (e) => { 
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = { // カードオブジェクトを生成
      number: formData.get("buyer_order[number]"),              // カード番号
      cvc: formData.get("buyer_order[cvc]"),                    // カード裏面の3桁の数字
      exp_month: formData.get("buyer_order[exp_month]"),        // 有効期限の月
      exp_year: `20${formData.get("buyer_order[exp_year]")}`,   // 有効期限の年
    };

    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");   //idを元に要素を取得
        const tokenObj = `<input value=${token} name='token' type="hidden">`;   //paramsの中にトークンを含める
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
           } 
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        
    });
  });
};

window.addEventListener("load", pay);
