let thisPage = 1;
let limit = 6;
let list = document.querySelectorAll('.list .item');
function loadItem(){
    let beginGet = limit * (thisPage -1);
    let endGet = limit * thisPage -1;
    list.forEach((item, key) =>{
        if(key >= beginGet && key <= endGet){
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
    listPage();
}
loadItem();

function listPage(){
    let count = Math.ceil(list.length / limit);
    document.querySelector('.listPage').innerHTML = '';
    if(list.length == 0){
        let notFound = document.createElement('h1');
        notFound.innerHTML = 'Not found any items';
        notFound.style = 'text-align: center;align-items: center;color: #6F6F6F;';
        notFound.classList.add('page-item');
        document.querySelector('.right').appendChild(notFound);
    } else {
        let lengthItem = document.createElement('h3');
        lengthItem.innerHTML = 'Found '+ list.length +' items.';
        lengthItem.style = 'text-align: center;align-items: center;color: #FF0D54;';
        lengthItem.classList.add('page-item');
        document.querySelector('#found').innerHTML = "";
        document.querySelector('#found').appendChild(lengthItem);
    }
    
    if(thisPage != 1 && list.length != 0){
        let prev = document.createElement('li');
        prev.innerHTML = '<<';
        prev.setAttribute('onclick',"changePage("+(thisPage-1)+")");
        prev.classList.add('page-item');
        document.querySelector('.listPage').appendChild(prev);
    }
    
    for(i=1;i<= count;i++){
        let newPage = document.createElement('li');
        newPage.innerText = i;
        if(i == thisPage){
            newPage.classList.add('active');
        }
        newPage.classList.add('page-item');
        newPage.setAttribute('onclick',"changePage("+i+")");
        document.querySelector('.listPage').appendChild(newPage);
    }
    
    if(thisPage != count && list.length != 0){
        let next = document.createElement('li');
        next.innerText = '>>';
        next.setAttribute('onclick',"changePage("+(thisPage+1)+")");
        next.classList.add('page-item');
        document.querySelector('.listPage').appendChild(next);
    }
    
}

function changePage(i){
    thisPage = i;
    loadItem();
}