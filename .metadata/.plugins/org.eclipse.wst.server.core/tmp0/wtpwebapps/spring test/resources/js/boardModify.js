console.log(bnoVal);
document.addEventListener('click',function(e){
    console.log(e.target);
    if(e.target.classList.contains('file-x')){
        let uuid = e.target.dataset.uuid;
        console.log(uuid, bnoVal);
        removeFile(uuid, bnoVal).then(result=>{
            console.log(result);
            if(result==1){
                alert("성공");
                e.target.closest('li').remove();
                this.location.reload();
            }else{
                alert("실패");
            }
        })
    }
})

async function removeFile(uuid, bnoVal){
    try {
        const url = '/board/file/'+uuid+'/'+ bnoVal;
        const config = {
            method : 'delete'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log("remove Error" + error);
    }
}