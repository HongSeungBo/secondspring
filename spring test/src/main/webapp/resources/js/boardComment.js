console.log(bnoVal);
console.log("writer : "+writerVal);
async function postCommentToServer(cmtData){
    try {
        const url = "/comment/post";
        const config = {
            method : "post",
            headers : {
                'content-type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData)
        };

        const resp = await fetch(url, config);
        const result = resp.text(); // isOk
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('cmtPostBtn').addEventListener('click',()=>{
    const cmtText = document.getElementById('cmtText').value;
    const cmtWriter = document.getElementById('cmtWriter').innerText;
    if(cmtText == "" || cmtText == null){
        alert("댓글을 입력해주세요.");
        document.getElementById('cmtText').focus();
        return false;
    }else{
        let cmtData = {
            bno : bnoVal,
            writer : cmtWriter,
            content : cmtText
        };
        console.log(cmtData);
        postCommentToServer(cmtData).then(result => {
            console.log(result);
            // isOk 확인
            if(result == 1){
                alert('댓글등록 성공');
                // 화면에 뿌리기
                getCommentList(bnoVal);
            }
        })
    }
})

async function spreadCommentListFromServer(bno){
    try {
        const resp = await fetch('/comment/'+bno);
        const result = await resp.json();
        return result;

    } catch (error) {
        console.log(error);
    }
}

function getCommentList(bno){
    spreadCommentListFromServer(bno).then(result =>{
        console.log(result);
        // 화면에 뿌리기
        /*
        id : cmtListArea
            <li>
            <div>
               <div>Writer</div>
               Content
            </div>
            <span>reg_date</span>
         </li>
        */
        const cmtListArea = document.getElementById('cmtListArea');
        if(result.length > 0){
            cmtListArea.innerHTML="";
            for(let cvo of result){
                let li = `<li data-cno="${cvo.cno}" data-writer="${cvo.writer}"><div>`;
                li += `<div>${cvo.writer}</div>`;
                li += `<input type="text" id="cmtTextMod" value="${cvo.content}"></div>`;
                li += `<span>${cvo.reg_date}</span>`;
                // if(writerVal == cvo.writer && writerVal != ""){
                    li += `<button type="button" class="modBtn">%</button>`;
                    li += `<button type="button" class="delBtn">X</button>`;
                // }
                li += `</li>`;
                cmtListArea.innerHTML += li;
            }
        }else{
            let li = `<li>Comment List Empty</li>`;
            cmtListArea.innerHTML = li;
        }

        // for(let i = 0; i<result.length; i++){
        //     let cmt = ``;
        //     cmt += `<li><div>`;
        //     cmt += `<div>${result[i].writer}</div>`;
        //     cmt += `${result[i].content}</div>`;
        //     cmt += `<span>${result[i].reg_date}</span></li>`;
    
        //     cmtListArea.innerHTML += cmt;
      
        // }
    })
}

async function editCommentToServer(cmtModData){
    try {
        const url = '/comment/' +cmtModData.cno;
        const config = {
            method : 'put',
            headers : {
                'content-type':'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtModData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }

}

async function removeCommentToServer(cmtData){
    try {
        const url = '/comment/del';
        const config = {
            method : 'delete',
            headers : {
                'content-type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', (e)=>{
    console.log(e.target);
    if(e.target.classList.contains('modBtn')){
        // 수정작업
        console.log('수정버튼 클릭~!!');
        // 내가 선택한 타겟과 가장 가까운 li 찾기
        let li = e.target.closest('li');
        let cnoVal = li.dataset.cno;
        let cmtWriter = li.dataset.writer;
        let textContent = li.querySelector('#cmtTextMod').value;
        console.log("cno / content " + cnoVal + " / " + textContent);

        let cmtModData = {
            cno : cnoVal,
            writer : cmtWriter,
            content : textContent
        };
        console.log(cmtModData);
        // 서버연결
        editCommentToServer(cmtModData).then(result => {
            if(result == 1){
                alert('댓글 수정 성공~!!');
            }else if(result == 2){
                alert('작성자가 일치하지 않음')
            }else{
                alert('실패');
            }
            getCommentList(bnoVal);
        })

    }else if(e.target.classList.contains('delBtn')){
        // 삭제작업
        console.log('삭제버튼 클릭~!!');

        let li = e.target.closest('li');
        let cnoVal = li.dataset.cno;
        let cmtWriter = li.dataset.writer;
        
        console.log("cno "+cnoVal);

        let cmtDelData = {
            cno : cnoVal,
            writer : cmtWriter,
            bno : bnoVal
        }
        removeCommentToServer(cmtDelData).then(result => {
            if(result == 1){
                alert('댓글 삭제 성공');
            }else if(result == 2){
                alert('작성자가 일치하지 않음')
            }else{
                alert('실패');
            }
            getCommentList(bnoVal);
        })
    }
})