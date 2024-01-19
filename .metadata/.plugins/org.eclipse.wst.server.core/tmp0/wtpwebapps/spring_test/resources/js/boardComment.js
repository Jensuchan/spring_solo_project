console.log("boardComment js in");
console.log(bnoVal);
console.log("authNick>>>>>" + authNick);
console.log("authEmail>>>>>" + authEmail);


document.getElementById('cmtPostBtn').addEventListener('click', () => {
    const cmtText = document.getElementById('cmtText');
    if (cmtText.value == null || cmtText.value == "") {
        alert('댓글을 입력해주세요.');
        cmtText.focus();
        return false;
    } else {
        let cmtData = {
            bno: bnoVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText.value
        };
        console.log(cmtData);
        postCommentToServer(cmtData).then(result => {
            if (result == '1') {
                alert('댓글이 등록되었습니다.');
                cmtText.value = '';
            }
            spreadCommentList(cmtData.bno);
        })
    }
})

async function postCommentToServer(cmtData) {
    try {
        const url = "/comment/post";
        const config = {
            method: "post",
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function getCommentListFromServer(bno, page) {
    try {
        const resp = await fetch('/comment/' + bno + '/' + page);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

function spreadCommentList(bno, page = 1) {
    getCommentListFromServer(bno, page).then(result => {
        console.log(result.cmtList);
        const ul = document.getElementById('cmtListArea');
        if (result.cmtList.length > 0) {
            if (page == 1) {
                ul.innerHTML = '';
            }
            for (let cvo of result.cmtList) {
                let li = `<li class="list-group-item" data-cno="${cvo.cno}" data-writer="${cvo.writer}">`;
                li += `<div class="mb-3">`;
                li += `<div class="fw-bold">${cvo.writer}</div>`;
                li += `${cvo.content}`;
                li += `</div>`;
                li += `<span class="badge rounded-pill text-bg-light">${cvo.modAt}</span><br>`;
                if (authNick == cvo.writer || authEmail == '111@naver.com') {
                    li += `<button type="button" class="btn btn-primary btn-sm mod" data-bs-toggle="modal" data-bs-target="#myModal">수정</button>`;
                    li += `<button type="button" class="btn btn-danger btn-sm del">삭제</button>`;
                }
                li += `</li>`;
                ul.innerHTML += li;
            }
            let moreBtn = document.getElementById('moreBtn');
            console.log(moreBtn);
            if (result.pgvo.pageNo < result.endPage) {
                moreBtn.style.visibility = 'visible';
                moreBtn.dataset.page = page + 1;
            } else {
                moreBtn.style.visibility = 'hidden';
            }
        } else {
            ul.innerHTML = '';
            let li = `<li class="list-group-item">댓글이 없습니다.</li>`;
            ul.innerHTML += li;
        }
    })
};

document.addEventListener('click', (e) => {
    console.log(e.target);
    if (e.target.id == 'moreBtn') {
        let page = parseInt(e.target.dataset.page);
        spreadCommentList(bnoVal, page);
    } else if (e.target.classList.contains('mod')) {
        let li = e.target.closest('li');
        let cmtText = li.querySelector('.fw-bold').nextSibling;
        console.log(cmtText);
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;
        document.getElementById('cmtModBtn').setAttribute('data-cno', li.dataset.cno);
        document.getElementById('cmtModBtn').setAttribute('data-writer', li.dataset.writer);
        document.querySelector('.modal-title').innerText = li.dataset.writer;
    } else if (e.target.id == 'cmtModBtn') {
        let cmtDataMod = {
            cno: e.target.dataset.cno,
            writer: e.target.dataset.writer,
            content: document.getElementById('cmtTextMod').value
        };
        console.log(cmtDataMod);
        modifyCommentToServer(cmtDataMod).then(result => {
            if (result == '1') {
                alert('댓글이 수정되었습니다.');
            } else {
                alert('수정 실패');
            }
            document.querySelector('.btn-close').click();
            spreadCommentList(bnoVal);
        })
    } else if (e.target.classList.contains('del')) {
        let li = e.target.closest('li');
        let cno = li.dataset.cno;
        console.log(cno);
        if (confirm('댓글을 삭제하시겠습니까?')) {
            removeCommentToServer(cno).then(result => {
                if (result == '1') {
                    alert('댓글이 삭제되었습니다.')
                    spreadCommentList(bnoVal);
                }
            })
        }
    }
})

async function modifyCommentToServer(cmtDataMod) {
    try {
        const url = "/comment/modify";
        const config = {
            method: 'put',
            headers: {
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(cmtDataMod)
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function removeCommentToServer(cno) {
    try {
        const resp = await fetch("/comment/" + cno, { method: 'delete' });
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}