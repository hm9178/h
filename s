<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>绘梦社区 - HuiMeng Forum</title>
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --bg-primary:#f5f6fa;
  --bg-secondary:#ffffff;
  --bg-tertiary:#eef0f7;
  --bg-card:#ffffff;
  --bg-hover:#eef0f7;
  --border:#dfe2ee;
  --border-light:#c8cce0;
  --text-primary:#1a1a2e;
  --text-secondary:#5a5f7a;
  --text-muted:#8b90a0;
  --accent:#6c5ce7;
  --accent-light:#a29bfe;
  --accent-glow:rgba(108,92,231,.1);
  --green:#00b894;
  --orange:#fdcb6e;
  --red:#e17055;
  --pink:#e84393;
  --radius:10px;
  --radius-lg:14px;
  --shadow:0 1px 8px rgba(0,0,0,.05);
  --shadow-lg:0 4px 20px rgba(0,0,0,.08);
  --transition:all .2s cubic-bezier(.4,0,.2,1);
  --header-h:48px;
  --bottom-h:56px;
  --max-w:960px;
}
html{scroll-behavior:smooth;font-size:13px}
body{
  font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Noto Sans SC',sans-serif;
  background:var(--bg-primary);
  color:var(--text-primary);
  line-height:1.5;
  min-height:100dvh;
  padding-top:var(--header-h);
  padding-bottom:var(--bottom-h);
  overflow-x:hidden;
}
a{color:inherit;text-decoration:none}
button{cursor:pointer;border:none;background:none;color:inherit;font:inherit}
input,textarea,select{font:inherit;color:inherit}

::-webkit-scrollbar{width:6px}
::-webkit-scrollbar-track{background:transparent}
::-webkit-scrollbar-thumb{background:var(--border);border-radius:3px}

/* ===== ONBOARDING ===== */
.onboarding{
  position:fixed;inset:0;z-index:9999;
  background:linear-gradient(135deg,#f0f1f6 0%,#e4e2f0 100%);
  display:flex;align-items:center;justify-content:center;
  transition:opacity .4s,visibility .4s;
}
.onboarding.hidden{opacity:0;visibility:hidden;pointer-events:none}
.onboarding-card{
  width:92%;max-width:360px;
  background:#fff;border-radius:20px;
  padding:32px 24px 28px;
  box-shadow:0 12px 40px rgba(0,0,0,.08);
  text-align:center;
  animation:popIn .5s cubic-bezier(.34,1.56,.64,1) both;
}
@keyframes popIn{from{opacity:0;transform:scale(.92) translateY(16px)}to{opacity:1;transform:scale(1) translateY(0)}}
.onboarding-logo{
  width:48px;height:48px;border-radius:14px;
  background:#1a1a2e;
  display:flex;align-items:center;justify-content:center;
  font-size:24px;font-weight:900;color:#fff;
  margin:0 auto 16px;
}
.onboarding-card h1{font-size:20px;font-weight:700;margin-bottom:4px;color:#1a1a2e}
.onboarding-card p{font-size:12px;color:var(--text-secondary);margin-bottom:20px}
.avatar-upload{
  width:84px;height:84px;border-radius:50%;
  margin:0 auto 16px;
  background:var(--bg-tertiary);
  border:3px dashed var(--border-light);
  display:flex;align-items:center;justify-content:center;
  cursor:pointer;transition:var(--transition);
  overflow:hidden;position:relative;
}
.avatar-upload:hover{border-color:var(--accent);background:var(--accent-glow)}
.avatar-upload svg{color:var(--text-muted);transition:var(--transition)}
.avatar-upload:hover svg{color:var(--accent)}
.avatar-upload.has-image svg{display:none}
.avatar-upload.has-image img{display:block;width:100%;height:100%;object-fit:cover}
.avatar-upload img{display:none}
.onboarding-input{
  width:100%;padding:10px 14px;
  background:var(--bg-tertiary);border:2px solid var(--border);
  border-radius:10px;font-size:14px;
  transition:var(--transition);margin-bottom:12px;text-align:center;
}
.onboarding-input:focus{outline:none;border-color:var(--accent);box-shadow:0 0 0 3px var(--accent-glow)}
.onboarding-input::placeholder{color:var(--text-muted)}
.onboarding-btn{
  width:100%;padding:10px;
  background:var(--accent);color:#fff;
  border-radius:10px;font-size:14px;font-weight:700;
  transition:var(--transition);
}
.onboarding-btn:hover{background:#5b4bd5;transform:translateY(-1px)}
.onboarding-btn:disabled{opacity:.45;cursor:not-allowed;transform:none}
.onboarding-hint{font-size:11px;color:var(--text-muted);margin-top:10px}

/* ===== HEADER ===== */
.header{
  position:fixed;top:0;left:0;right:0;z-index:100;
  background:rgba(255,255,255,.92);
  backdrop-filter:blur(16px);
  border-bottom:1px solid var(--border);
  display:none;height:var(--header-h);
}
.header-inner{
  max-width:var(--max-w);margin:0 auto;
  display:flex;align-items:center;gap:8px;
  padding:0 12px;height:100%;
}
.logo{
  display:flex;align-items:center;gap:8px;
  font-size:16px;font-weight:700;letter-spacing:-.3px;
  color:#1a1a2e;white-space:nowrap;cursor:pointer;
  margin-right:auto;
}
.logo-icon{
  width:30px;height:30px;border-radius:8px;
  background:#1a1a2e;
  display:flex;align-items:center;justify-content:center;
  font-size:16px;font-weight:900;color:#fff;
}
.search-box{
  flex:1;max-width:280px;margin:0 8px;position:relative;
}
.search-box input{
  width:100%;padding:6px 10px 6px 32px;
  background:var(--bg-tertiary);border:1px solid var(--border);
  border-radius:8px;font-size:12px;
  transition:var(--transition);
}
.search-box input:focus{outline:none;border-color:var(--accent);box-shadow:0 0 0 2px var(--accent-glow)}
.search-box input::placeholder{color:var(--text-muted)}
.search-box svg{position:absolute;left:10px;top:50%;transform:translateY(-50%);color:var(--text-muted);width:15px;height:15px}
.header-actions{display:flex;align-items:center;gap:8px;margin-left:auto;flex-shrink:0}
.btn{padding:6px 14px;border-radius:7px;font-size:12px;font-weight:600;transition:var(--transition)}
.btn-primary{background:var(--accent);color:#fff}
.btn-primary:hover{background:#5b4bd5;transform:translateY(-1px)}
.btn-ghost{color:var(--text-secondary);padding:6px 10px}
.btn-ghost:hover{color:var(--text-primary);background:var(--bg-hover)}
.btn-danger{color:var(--red)}
.btn-danger:hover{background:rgba(225,112,85,.08)}
.avatar-btn{
  width:30px;height:30px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:12px;font-weight:700;color:#fff;
  flex-shrink:0;cursor:pointer;
  transition:var(--transition);border:2px solid transparent;overflow:hidden;
}
.avatar-btn:hover{border-color:var(--accent);transform:scale(1.05)}
.avatar-btn img{width:100%;height:100%;object-fit:cover}
.admin-badge{
  font-size:9px;font-weight:700;
  padding:1px 6px;border-radius:8px;
  background:linear-gradient(135deg,var(--accent),var(--pink));
  color:#fff;display:none;
}

/* ===== MAIN WRAP ===== */
.main-wrap{
  max-width:var(--max-w);margin:0 auto;
  padding:10px 10px;display:none;
}
.page-content{display:none}
.page-content.active{display:block}

/* ===== CATEGORY TABS ===== */
.category-tabs{
  display:flex;gap:6px;margin-bottom:10px;
  overflow-x:auto;padding-bottom:2px;
  align-items:center;-webkit-overflow-scrolling:touch;
}
.category-tabs::-webkit-scrollbar{display:none}
.cat-tab{
  padding:5px 14px;border-radius:16px;
  font-size:12px;font-weight:500;white-space:nowrap;
  background:var(--bg-secondary);border:1px solid var(--border);
  color:var(--text-secondary);transition:var(--transition);position:relative;
}
.cat-tab:hover{border-color:var(--border-light);color:var(--text-primary)}
.cat-tab.active{background:var(--accent);border-color:var(--accent);color:#fff}
.cat-tab .cat-edit{
  display:none;position:absolute;top:-3px;right:-3px;
  width:15px;height:15px;border-radius:50%;
  background:var(--accent);color:#fff;font-size:8px;
  align-items:center;justify-content:center;
}
.cat-tab:hover .cat-edit{display:flex}
.cat-tab.active .cat-edit{background:#fff;color:var(--accent)}
.add-cat-btn{
  padding:5px 10px;border-radius:16px;
  font-size:12px;font-weight:600;white-space:nowrap;
  background:transparent;border:1px dashed var(--border-light);
  color:var(--text-muted);transition:var(--transition);flex-shrink:0;
}
.add-cat-btn:hover{border-color:var(--accent);color:var(--accent)}

/* ===== THREAD LIST ===== */
.thread-list{display:flex;flex-direction:column;gap:6px}
.thread-card{
  display:flex;gap:10px;padding:12px;
  background:var(--bg-card);border:1px solid var(--border);
  border-radius:var(--radius);transition:var(--transition);
  animation:fadeUp .3s ease both;position:relative;cursor:default;
}
.thread-card:hover{border-color:var(--border-light);background:var(--bg-secondary);box-shadow:var(--shadow)}
@keyframes fadeUp{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:translateY(0)}}
.thread-avatar{
  width:34px;height:34px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:13px;font-weight:700;color:#fff;
  flex-shrink:0;overflow:hidden;cursor:pointer;
  transition:var(--transition);position:relative;
}
.thread-avatar:hover{transform:scale(1.08)}
.thread-avatar img{width:100%;height:100%;object-fit:cover}
.thread-avatar .admin-crown{
  position:absolute;top:-3px;right:-3px;
  width:14px;height:14px;border-radius:50%;
  background:linear-gradient(135deg,#fdcb6e,#f39c12);
  display:flex;align-items:center;justify-content:center;font-size:8px;
  box-shadow:0 1px 3px rgba(0,0,0,.15);
}
.thread-body{flex:1;min-width:0}
.thread-meta{display:flex;align-items:center;gap:6px;margin-bottom:2px;flex-wrap:wrap}
.thread-author{font-size:12px;font-weight:600;color:var(--accent)}
.thread-author.admin{color:#e17055}
.thread-time{font-size:11px;color:var(--text-muted)}
.thread-tag{
  padding:1px 8px;border-radius:10px;font-size:10px;font-weight:600;
}
.tag-announce{background:rgba(225,112,85,.12);color:var(--red)}
.tag-server{background:rgba(9,132,227,.1);color:#0984e3}
.tag-guide{background:rgba(0,184,148,.1);color:var(--green)}
.tag-event{background:rgba(214,48,49,.1);color:#d63031}
.tag-market{background:rgba(253,203,110,.2);color:#e17055}
.tag-skill{background:rgba(108,92,231,.12);color:var(--accent)}
.tag-chat{background:rgba(162,155,254,.15);color:var(--accent)}
.thread-title{font-size:13px;font-weight:600;margin-bottom:2px;line-height:1.3}
.thread-title a:hover{color:var(--accent)}
.thread-excerpt{font-size:11px;color:var(--text-secondary);line-height:1.4;
  display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden}
.thread-footer{display:flex;align-items:center;gap:10px;margin-top:6px}
.thread-stat{
  display:flex;align-items:center;gap:3px;
  font-size:11px;color:var(--text-muted);cursor:pointer;transition:var(--transition);
}
.thread-stat svg{width:14px;height:14px}
.thread-stat.like-btn:hover{color:var(--red)}
.thread-stat.like-btn.liked{color:var(--red)}
.thread-stat.view-btn{cursor:default}
.thread-actions{
  position:absolute;top:8px;right:8px;
  display:flex;gap:2px;opacity:0;transition:var(--transition);
}
.thread-card:hover .thread-actions{opacity:1}
.thread-action-btn{
  width:26px;height:26px;border-radius:6px;
  display:flex;align-items:center;justify-content:center;transition:var(--transition);
}
.thread-action-btn:hover{background:var(--bg-tertiary)}
.thread-action-btn.delete:hover{background:rgba(225,112,85,.1);color:var(--red)}
.thread-action-btn.edit:hover{background:rgba(108,92,231,.1);color:var(--accent)}

/* ===== SIDEBAR (hidden on mobile) ===== */
.sidebar{display:none}

/* ===== MODAL ===== */
.modal-overlay{
  position:fixed;inset:0;z-index:200;
  background:rgba(0,0,0,.4);backdrop-filter:blur(3px);
  display:flex;align-items:center;justify-content:center;
  opacity:0;visibility:hidden;transition:var(--transition);
}
.modal-overlay.active{opacity:1;visibility:visible}
.modal{
  width:92%;max-width:480px;max-height:90dvh;overflow-y:auto;
  background:var(--bg-secondary);border:1px solid var(--border);
  border-radius:var(--radius-lg);padding:20px 18px;
  box-shadow:var(--shadow-lg);transform:translateY(16px) scale(.97);transition:var(--transition);
}
.modal-overlay.active .modal{transform:translateY(0) scale(1)}
.modal-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:14px}
.modal-header h2{font-size:16px;font-weight:700}
.modal-close{
  width:28px;height:28px;border-radius:6px;
  display:flex;align-items:center;justify-content:center;transition:var(--transition);
}
.modal-close:hover{background:var(--bg-hover)}
.form-group{margin-bottom:12px}
.form-group label{display:block;font-size:12px;font-weight:600;margin-bottom:4px;color:var(--text-secondary)}
.form-group input,.form-group textarea,.form-group select{
  width:100%;padding:8px 12px;
  background:var(--bg-tertiary);border:1px solid var(--border);
  border-radius:8px;font-size:13px;transition:var(--transition);
}
.form-group input:focus,.form-group textarea:focus,.form-group select:focus{
  outline:none;border-color:var(--accent);box-shadow:0 0 0 2px var(--accent-glow);
}
.form-group textarea{resize:vertical;min-height:100px}
.form-group select{cursor:pointer}
.modal-actions{display:flex;gap:8px;justify-content:flex-end;margin-top:14px}

/* ===== MARKDOWN ===== */
.md-toolbar{
  display:flex;gap:2px;flex-wrap:wrap;padding:6px 8px;
  background:var(--bg-tertiary);border:1px solid var(--border);border-bottom:none;
  border-radius:8px 8px 0 0;
}
.md-btn{
  width:28px;height:28px;border-radius:5px;
  display:flex;align-items:center;justify-content:center;
  font-size:13px;font-weight:600;color:var(--text-secondary);transition:var(--transition);
}
.md-btn:hover{background:var(--bg-hover);color:var(--text-primary)}
.md-textarea{border-radius:0 0 8px 8px !important;border-top:1px solid var(--border) !important;min-height:140px !important;font-family:'SFMono-Regular',Consolas,'Liberation Mono',Menlo,monospace;font-size:13px !important;line-height:1.6;}
.md-preview{
  padding:10px 14px;background:var(--bg-tertiary);border:1px solid var(--border);
  border-radius:0 0 8px 8px;font-size:13px;line-height:1.6;
  max-height:200px;overflow-y:auto;display:none;
}
.md-preview.active{display:block}
.md-preview h1,.md-preview h2,.md-preview h3{margin:8px 0 4px;font-weight:700}
.md-preview h1{font-size:18px}.md-preview h2{font-size:16px}.md-preview h3{font-size:14px}
.md-preview p{margin:4px 0}
.md-preview ul,.md-preview ol{margin:4px 0 4px 20px}
.md-preview code{background:var(--bg-hover);padding:1px 4px;border-radius:3px;font-size:12px}
.md-preview pre{background:var(--bg-hover);padding:8px 12px;border-radius:6px;overflow-x:auto;margin:4px 0}
.md-preview pre code{background:none;padding:0}
.md-preview blockquote{border-left:3px solid var(--accent);padding-left:10px;color:var(--text-secondary);margin:4px 0}
.md-preview a{color:var(--accent)}
.md-preview strong{font-weight:700}
.md-preview em{font-style:italic}
.md-preview hr{border:none;border-top:1px solid var(--border);margin:8px 0}
.md-tab-toggle{display:flex;gap:0;margin-bottom:6px}
.md-tab-btn{
  padding:4px 12px;border-radius:6px 6px 0 0;font-size:11px;font-weight:600;
  background:var(--bg-tertiary);border:1px solid var(--border);color:var(--text-muted);transition:var(--transition);cursor:pointer;
}
.md-tab-btn.active{background:var(--bg-secondary);color:var(--accent);border-bottom-color:var(--bg-secondary)}

/* ===== PROFILE MODAL ===== */
.avatar-upload-small{
  width:64px;height:64px;border-radius:50%;margin:0 auto 16px;
  background:var(--bg-tertiary);border:3px dashed var(--border-light);
  display:flex;align-items:center;justify-content:center;cursor:pointer;
  transition:var(--transition);overflow:hidden;position:relative;
}
.avatar-upload-small:hover{border-color:var(--accent);background:var(--accent-glow)}
.avatar-upload-small svg{color:var(--text-muted)}
.avatar-upload-small.has-image svg{display:none}
.avatar-upload-small.has-image img{display:block;width:100%;height:100%;object-fit:cover}
.avatar-upload-small.has-image{border-style:solid;border-color:var(--accent)}
.avatar-upload-small img{display:none}

/* ===== CONFIRM DIALOG ===== */
.confirm-overlay{
  position:fixed;inset:0;z-index:250;
  background:rgba(0,0,0,.4);backdrop-filter:blur(3px);
  display:flex;align-items:center;justify-content:center;
  opacity:0;visibility:hidden;transition:var(--transition);
}
.confirm-overlay.active{opacity:1;visibility:visible}
.confirm-dialog{
  width:88%;max-width:340px;background:var(--bg-secondary);
  border:1px solid var(--border);border-radius:var(--radius-lg);
  padding:24px 20px;box-shadow:var(--shadow-lg);text-align:center;
  transform:translateY(16px) scale(.97);transition:var(--transition);
}
.confirm-overlay.active .confirm-dialog{transform:translateY(0) scale(1)}
.confirm-icon{width:48px;height:48px;border-radius:50%;background:rgba(225,112,85,.1);display:flex;align-items:center;justify-content:center;margin:0 auto 12px;}
.confirm-icon svg{color:var(--red);width:24px;height:24px}
.confirm-icon.grant{background:rgba(108,92,231,.1)}
.confirm-icon.grant svg{color:var(--accent)}
.confirm-dialog h3{font-size:15px;font-weight:700;margin-bottom:6px}
.confirm-dialog p{font-size:12px;color:var(--text-secondary);margin-bottom:18px}
.confirm-actions{display:flex;gap:8px;justify-content:center}
.btn-confirm-delete{background:var(--red);color:#fff;padding:8px 22px;border-radius:7px;font-weight:600;font-size:12px;transition:var(--transition)}
.btn-confirm-delete:hover{background:#c0392b}
.btn-confirm-grant{background:var(--accent);color:#fff;padding:8px 22px;border-radius:7px;font-weight:600;font-size:12px;transition:var(--transition)}
.btn-confirm-grant:hover{background:#5b4bd5}

/* ===== CATEGORY MANAGE ===== */
.cat-manage-list{display:flex;flex-direction:column;gap:6px;max-height:260px;overflow-y:auto;margin-bottom:12px}
.cat-manage-item{
  display:flex;align-items:center;gap:8px;padding:8px 10px;
  background:var(--bg-tertiary);border:1px solid var(--border);border-radius:8px;
}
.cat-manage-item input{flex:1;padding:5px 8px;background:transparent;border:none;font-size:13px;font-weight:500;}
.cat-manage-item input:focus{outline:none}
.cat-manage-item .tag-preview{padding:1px 8px;border-radius:10px;font-size:10px;font-weight:600;flex-shrink:0;}
.cat-manage-btn{width:24px;height:24px;border-radius:5px;display:flex;align-items:center;justify-content:center;transition:var(--transition);flex-shrink:0;}
.cat-manage-btn:hover{background:var(--bg-hover)}
.cat-manage-btn.del:hover{background:rgba(225,112,85,.1);color:var(--red)}

/* ===== PAGINATION ===== */
.pagination{display:flex;align-items:center;justify-content:center;gap:4px;margin-top:12px}
.page-btn{
  width:28px;height:28px;border-radius:6px;
  display:flex;align-items:center;justify-content:center;
  font-size:12px;font-weight:500;
  background:var(--bg-secondary);border:1px solid var(--border);
  color:var(--text-secondary);transition:var(--transition);
}
.page-btn:hover{border-color:var(--border-light);color:var(--text-primary)}
.page-btn.active{background:var(--accent);border-color:var(--accent);color:#fff}

/* ===== BOTTOM NAV ===== */
.bottom-nav{
  position:fixed;bottom:0;left:0;right:0;z-index:100;
  background:rgba(255,255,255,.92);backdrop-filter:blur(16px);
  border-top:1px solid var(--border);display:none;height:var(--bottom-h);
}
.bottom-nav-inner{
  max-width:var(--max-w);margin:0 auto;
  display:flex;align-items:center;justify-content:space-around;height:100%;padding:0 8px;
}
.nav-item{
  display:flex;flex-direction:column;align-items:center;gap:2px;
  padding:4px 16px;border-radius:8px;transition:var(--transition);
  color:var(--text-muted);cursor:pointer;-webkit-tap-highlight-color:transparent;
}
.nav-item.active{color:var(--accent)}
.nav-item svg{width:20px;height:20px}
.nav-item span{font-size:10px;font-weight:600}
.nav-item:hover{color:var(--text-primary)}

/* ===== MY PAGE ===== */
.my-header{
  display:flex;align-items:center;gap:12px;padding:14px;
  background:var(--bg-card);border:1px solid var(--border);border-radius:var(--radius-lg);margin-bottom:10px;
}
.my-avatar{
  width:48px;height:48px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:18px;font-weight:700;color:#fff;overflow:hidden;flex-shrink:0;
}
.my-avatar img{width:100%;height:100%;object-fit:cover}
.my-info{flex:1;min-width:0}
.my-name{font-size:15px;font-weight:700;display:flex;align-items:center;gap:6px}
.my-name .admin-badge{display:inline-block}
.my-bio{font-size:12px;color:var(--text-secondary);margin-top:2px}
.my-stats{display:flex;gap:14px;margin-top:6px}
.my-stat{font-size:12px;color:var(--text-muted)}
.my-stat b{color:var(--text-primary);font-weight:700}
.my-actions{display:flex;gap:6px;margin-top:10px}
.my-actions .btn{font-size:11px;padding:5px 12px}

/* ===== TOAST ===== */
.toast{
  position:fixed;bottom:68px;left:50%;z-index:300;
  transform:translateX(-50%) translateY(20px);
  padding:10px 20px;background:var(--bg-primary);
  border:1px solid var(--green);border-radius:var(--radius);
  font-size:12px;font-weight:500;box-shadow:var(--shadow-lg);
  opacity:0;transition:var(--transition);white-space:nowrap;
}
.toast.show{transform:translateX(-50%) translateY(0);opacity:1}
.toast.error{border-color:var(--red)}

/* ===== DARK MODE ===== */
body.dark{
  --bg-primary:#1a1a2e;--bg-secondary:#24243e;--bg-tertiary:#2d2d4e;--bg-card:#24243e;--bg-hover:#2d2d4e;
  --border:#3a3a5e;--border-light:#4a4a6e;--text-primary:#e8e8f0;--text-secondary:#a0a0c0;--text-muted:#6e6e90;
  --accent-glow:rgba(108,92,231,.15);
}
body.dark .header,body.dark .bottom-nav{background:rgba(26,26,46,.92)}
body.dark .onboarding{background:linear-gradient(135deg,#1a1a2e 0%,#24243e 100%)}
body.dark .onboarding-card{background:#24243e}
body.dark .modal,.body.dark .confirm-dialog{background:#24243e}
body.dark .md-preview{background:#2d2d4e}
body.dark .md-preview pre{background:#1a1a2e}
body.dark .md-preview code{background:#2d2d4e}

/* ===== RESPONSIVE ===== */
@media(min-width:768px){
  :root{--max-w:1100px;font-size:14px}
  .sidebar{display:block;width:260px;flex-shrink:0}
  .container{max-width:var(--max-w);margin:0 auto;padding:14px 10px;display:none;flex:1;gap:14px}
  .main{flex:1;min-width:0}
  .thread-card{padding:14px}
  .thread-avatar{width:38px;height:38px;font-size:14px}
  .thread-title{font-size:14px}
  .main-wrap{max-width:var(--max-w)}
}
@media(max-width:767px){
  .search-box{display:none}
  .thread-actions{opacity:1}
}

/* ===== USER CARD POPUP ===== */
.user-card-overlay{
  position:fixed;inset:0;z-index:300;display:none;
  background:transparent;
}
.user-card-overlay.active{display:block}
.user-card{
  position:fixed;z-index:310;
  width:280px;
  background:var(--bg-secondary);border:1px solid var(--border);
  border-radius:var(--radius-lg);padding:20px 16px 16px;
  box-shadow:var(--shadow-lg);
  animation:fadeUp .25s ease both;
}
.user-card-header{
  display:flex;align-items:center;gap:10px;margin-bottom:10px;
}
.user-card-avatar{
  width:44px;height:44px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:16px;font-weight:700;color:#fff;overflow:hidden;flex-shrink:0;
}
.user-card-avatar img{width:100%;height:100%;object-fit:cover}
.user-card-name{font-size:14px;font-weight:700}
.user-card-bio{font-size:11px;color:var(--text-secondary);margin-bottom:10px;line-height:1.4}
.user-card-stats{display:flex;gap:12px;margin-bottom:12px}
.user-card-stat{font-size:11px;color:var(--text-muted)}
.user-card-stat b{color:var(--text-primary);font-weight:600}
.user-card-actions{display:flex;gap:6px}
.user-card .btn{font-size:11px;padding:5px 12px;flex:1;text-align:center}

/* ===== VIEWERS POPUP ===== */
.viewers-overlay{
  position:fixed;inset:0;z-index:250;
  background:rgba(0,0,0,.4);backdrop-filter:blur(3px);
  display:none;align-items:center;justify-content:center;
  opacity:0;transition:var(--transition);
}
.viewers-overlay.active{display:flex;opacity:1}
.viewers-dialog{
  width:88%;max-width:360px;
  background:var(--bg-secondary);border:1px solid var(--border);
  border-radius:var(--radius-lg);padding:20px 18px;
  box-shadow:var(--shadow-lg);
  transform:translateY(16px) scale(.97);transition:var(--transition);
}
.viewers-overlay.active .viewers-dialog{transform:translateY(0) scale(1)}
.viewers-list{display:flex;flex-direction:column;gap:8px;max-height:300px;overflow-y:auto;margin-top:12px}
.viewer-item{display:flex;align-items:center;gap:10px;padding:8px 10px;background:var(--bg-tertiary);border-radius:8px}
.viewer-item-avatar{
  width:32px;height:32px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:12px;font-weight:700;color:#fff;overflow:hidden;flex-shrink:0;
}
.viewer-item-avatar img{width:100%;height:100%;object-fit:cover}
.viewer-item-name{font-size:13px;font-weight:600}
.viewer-item-time{font-size:11px;color:var(--text-muted);margin-left:auto}

/* ===== POST DETAIL ===== */
.post-detail-overlay{
  position:fixed;inset:0;z-index:200;
  background:rgba(0,0,0,.45);backdrop-filter:blur(4px);
  display:none;align-items:center;justify-content:center;
  opacity:0;transition:var(--transition);
}
.post-detail-overlay.active{display:flex;opacity:1}
.post-detail{
  width:94%;max-width:640px;max-height:90dvh;overflow-y:auto;
  background:var(--bg-secondary);border:1px solid var(--border);
  border-radius:var(--radius-lg);padding:20px 18px;
  box-shadow:var(--shadow-lg);
  transform:translateY(16px) scale(.97);transition:var(--transition);
}
.post-detail-overlay.active .post-detail{transform:translateY(0) scale(1)}
.post-detail-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:14px}
.post-detail-body{font-size:13px;line-height:1.7;margin-bottom:16px}
.post-detail-body h1{font-size:20px;font-weight:700;margin:12px 0 6px}
.post-detail-body h2{font-size:17px;font-weight:700;margin:10px 0 5px}
.post-detail-body h3{font-size:15px;font-weight:700;margin:8px 0 4px}
.post-detail-body p{margin:4px 0}
.post-detail-body ul,.post-detail-body ol{margin:4px 0 4px 20px}
.post-detail-body code{background:var(--bg-hover);padding:1px 4px;border-radius:3px;font-size:12px}
.post-detail-body pre{background:var(--bg-hover);padding:10px 14px;border-radius:6px;overflow-x:auto;margin:6px 0}
.post-detail-body pre code{background:none;padding:0}
.post-detail-body blockquote{border-left:3px solid var(--accent);padding-left:10px;color:var(--text-secondary);margin:6px 0}
.post-detail-body a{color:var(--accent)}
.post-detail-body strong{font-weight:700}
.post-detail-body em{font-style:italic}
.post-detail-body hr{border:none;border-top:1px solid var(--border);margin:10px 0}
.post-detail-actions{display:flex;align-items:center;gap:12px;padding:10px 0;border-top:1px solid var(--border)}
.post-detail-actions .thread-stat{cursor:pointer}
.post-detail-actions .thread-stat.liked{color:var(--red)}

/* ===== COMMENTS ===== */
.comments-section{margin-top:16px;border-top:1px solid var(--border);padding-top:14px}
.comments-title{font-size:14px;font-weight:700;margin-bottom:10px}
.comment-item{
  display:flex;gap:8px;padding:10px 0;
  border-bottom:1px solid var(--border);
}
.comment-item:last-child{border-bottom:none}
.comment-avatar{
  width:28px;height:28px;border-radius:50%;
  display:flex;align-items:center;justify-content:center;
  font-size:10px;font-weight:700;color:#fff;overflow:hidden;flex-shrink:0;
}
.comment-avatar img{width:100%;height:100%;object-fit:cover}
.comment-body{flex:1;min-width:0}
.comment-meta{display:flex;align-items:center;gap:6px;margin-bottom:2px}
.comment-author{font-size:12px;font-weight:600;color:var(--accent)}
.comment-time{font-size:10px;color:var(--text-muted)}
.comment-text{font-size:12px;color:var(--text-secondary);line-height:1.5}
.comment-input-wrap{
  display:flex;gap:8px;margin-top:10px;align-items:flex-start;
}
.comment-input{
  flex:1;padding:8px 12px;
  background:var(--bg-tertiary);border:1px solid var(--border);
  border-radius:8px;font-size:12px;resize:vertical;min-height:36px;
  transition:var(--transition);
}
.comment-input:focus{outline:none;border-color:var(--accent);box-shadow:0 0 0 2px var(--accent-glow)}
.comment-submit{
  padding:7px 14px;border-radius:7px;font-size:12px;font-weight:600;
  background:var(--accent);color:#fff;transition:var(--transition);flex-shrink:0;
}
.comment-submit:hover{background:#5b4bd5}
.comment-delete{
  margin-left:auto;width:20px;height:20px;border-radius:4px;
  display:flex;align-items:center;justify-content:center;
  transition:var(--transition);flex-shrink:0;
}
.comment-delete:hover{background:rgba(225,112,85,.1);color:var(--red)}

/* ===== DM (Direct Message) ===== */
.dm-overlay{
  position:fixed;inset:0;z-index:320;
  background:rgba(0,0,0,.4);backdrop-filter:blur(3px);
  display:none;align-items:center;justify-content:center;
  opacity:0;transition:var(--transition);
}
.dm-overlay.active{display:flex;opacity:1}
.dm-dialog{
  width:90%;max-width:420px;
  background:var(--bg-secondary);border:1px solid var(--border);
  border-radius:var(--radius-lg);
  box-shadow:var(--shadow-lg);
  transform:translateY(16px) scale(.97);transition:var(--transition);
  display:flex;flex-direction:column;max-height:80dvh;
}
.dm-overlay.active .dm-dialog{transform:translateY(0) scale(1)}
.dm-header{
  display:flex;align-items:center;justify-content:space-between;
  padding:14px 16px;border-bottom:1px solid var(--border);
}
.dm-header h3{font-size:14px;font-weight:700}
.dm-close{
  width:26px;height:26px;border-radius:6px;
  display:flex;align-items:center;justify-content:center;transition:var(--transition);
}
.dm-close:hover{background:var(--bg-hover)}
.dm-messages{
  flex:1;overflow-y:auto;padding:12px 14px;
  display:flex;flex-direction:column;gap:8px;
  min-height:200px;max-height:340px;
}
.dm-msg{
  max-width:80%;padding:8px 12px;border-radius:10px;font-size:12px;line-height:1.5;
}
.dm-msg.sent{
  align-self:flex-end;background:var(--accent);color:#fff;
  border-bottom-right-radius:4px;
}
.dm-msg.received{
  align-self:flex-start;background:var(--bg-tertiary);color:var(--text-primary);
  border-bottom-left-radius:4px;
}
.dm-msg-time{font-size:9px;opacity:.6;margin-top:2px;text-align:right}
.dm-input-area{
  display:flex;gap:6px;padding:10px 14px;border-top:1px solid var(--border);
}
.dm-input{
  flex:1;padding:7px 10px;
  background:var(--bg-tertiary);border:1px solid var(--border);
  border-radius:8px;font-size:12px;transition:var(--transition);
}
.dm-input:focus{outline:none;border-color:var(--accent);box-shadow:0 0 0 2px var(--accent-glow)}
.dm-send{
  padding:7px 14px;border-radius:7px;font-size:12px;font-weight:600;
  background:var(--accent);color:#fff;transition:var(--transition);
}
.dm-send:hover{background:#5b4bd5}
.dm-empty{text-align:center;color:var(--text-muted);font-size:12px;padding:20px}
</style>
</head>
<body>

<!-- ONBOARDING -->
<div class="onboarding" id="onboarding">
  <div class="onboarding-card">
    <div class="onboarding-logo">H</div>
    <h1>欢迎来到绘梦社区</h1>
    <p>上传头像并设置昵称，开始探索吧</p>
    <div class="avatar-upload" id="onboardAvatarUpload" onclick="document.getElementById('onboardAvatarInput').click()">
      <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
      <img id="onboardAvatarImg" alt="">
    </div>
    <input type="file" id="onboardAvatarInput" accept="image/*" style="display:none" onchange="handleOnboardAvatar(event)">
    <input type="text" class="onboarding-input" id="onboardName" placeholder="请输入你的昵称..." maxlength="20" oninput="checkOnboardReady()">
    <button class="onboarding-btn" id="onboardBtn" disabled onclick="enterForum()">进入社区</button>
    <div class="onboarding-hint">头像和昵称为必填项</div>
  </div>
</div>

<!-- HEADER -->
<header class="header" id="header">
  <div class="header-inner">
    <a href="#" class="logo" onclick="switchPage('community')">
      <div class="logo-icon">H</div>
      <span>绘梦社区</span>
    </a>
    <div class="search-box">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input type="text" placeholder="搜索帖子、用户..." id="searchInput">
    </div>
    <div class="header-actions">
      <button class="btn btn-primary" onclick="openModal()">发帖</button>
      <span id="adminBadge" class="admin-badge">管理员</span>
      <div class="avatar-btn" id="myAvatarBtn" onclick="switchPage('my')" title="我的"></div>
    </div>
  </div>
</header>

<!-- MAIN WRAP -->
<div class="main-wrap" id="mainWrap">
  <!-- COMMUNITY PAGE -->
  <div class="page-content active" id="pageCommunity">
    <div class="category-tabs" id="categoryTabs"></div>
    <div class="thread-list" id="threadList"></div>
    <div class="pagination" id="pagination"></div>
  </div>

  <!-- MY PAGE -->
  <div class="page-content" id="pageMy">
    <div class="my-header" id="myHeader">
      <div class="my-avatar" id="myPageAvatar"></div>
      <div class="my-info">
        <div class="my-name" id="myPageName"></div>
        <div class="my-bio" id="myPageBio">这个人很懒，什么都没写~</div>
        <div class="my-stats">
          <div class="my-stat">帖子：<b id="myPostCount">0</b></div>
          <div class="my-stat">回复：<b id="myReplyCount">0</b></div>
          <div class="my-stat">注册：<b id="myRegDate">2026-07</b></div>
        </div>
        <div class="my-actions">
          <button class="btn btn-primary" onclick="openProfile()">编辑资料</button>
          <button class="btn btn-ghost" onclick="switchPage('community')">返回社区</button>
        </div>
      </div>
    </div>
    <h3 style="font-size:13px;font-weight:700;margin-bottom:8px;padding:0 4px">我的帖子</h3>
    <div class="thread-list" id="myThreadList"></div>
    <div id="myEmpty" style="text-align:center;padding:32px;color:var(--text-muted);font-size:13px;display:none">你还没有发过帖子</div>
  </div>
</div>

<!-- BOTTOM NAV -->
<nav class="bottom-nav" id="bottomNav">
  <div class="bottom-nav-inner">
    <div class="nav-item" id="navOfficial" onclick="goOfficial()">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      <span>官网</span>
    </div>
    <div class="nav-item active" id="navCommunity" onclick="switchPage('community')">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
      <span>社区</span>
    </div>
    <div class="nav-item" id="navMy" onclick="switchPage('my')">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
      <span>我的</span>
    </div>
  </div>
</nav>

<!-- NEW THREAD MODAL -->
<div class="modal-overlay" id="modalOverlay" onclick="closeModal(event)">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-header">
      <h2 id="modalTitle">发布新帖子</h2>
      <button class="modal-close" onclick="closeModal()">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="form-group">
      <label>分类</label>
      <select id="newCategory"></select>
    </div>
    <div class="form-group">
      <label>标题</label>
      <input type="text" id="newTitle" placeholder="请输入帖子标题...">
    </div>
    <div class="form-group">
      <label>内容（支持 Markdown）</label>
      <div class="md-tab-toggle">
        <div class="md-tab-btn active" onclick="switchMdTab('write',this)">写内容</div>
        <div class="md-tab-btn" onclick="switchMdTab('preview',this)">预览</div>
      </div>
      <div class="md-toolbar" id="mdToolbar">
        <button class="md-btn" onclick="mdInsert('**','**')" title="加粗"><b>B</b></button>
        <button class="md-btn" onclick="mdInsert('*','*')" title="斜体"><i>I</i></button>
        <button class="md-btn" onclick="mdInsert('~~','~~')" title="删除线">S</button>
        <button class="md-btn" onclick="mdInsert('`','`')" title="行内代码">&lt;/&gt;</button>
        <button class="md-btn" onclick="mdInsert('\n```\n','\n```\n')" title="代码块">{ }</button>
        <button class="md-btn" onclick="mdInsert('> ','')" title="引用">❝</button>
        <button class="md-btn" onclick="mdInsert('## ','')" title="标题">H</button>
        <button class="md-btn" onclick="mdInsert('- ','')" title="列表">•</button>
        <button class="md-btn" onclick="mdInsert('[','](url)')" title="链接">🔗</button>
        <button class="md-btn" onclick="mdInsert('\n---\n','')" title="分隔线">—</button>
      </div>
      <textarea class="md-textarea" id="newContent" placeholder="支持 Markdown 格式..." oninput="updateMdPreview()"></textarea>
      <div class="md-preview" id="mdPreview"></div>
    </div>
    <div class="modal-actions">
      <button class="btn btn-ghost" onclick="closeModal()">取消</button>
      <button class="btn btn-primary" id="modalSubmitBtn" onclick="submitThread()">发布</button>
    </div>
  </div>
</div>

<!-- PROFILE MODAL -->
<div class="modal-overlay" id="profileOverlay" onclick="closeProfile(event)">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-header">
      <h2>个人资料</h2>
      <button class="modal-close" onclick="closeProfile()">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="avatar-upload-small" id="profileAvatarUpload" onclick="document.getElementById('profileAvatarInput').click()">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
      <img id="profileAvatarImg" alt="">
    </div>
    <input type="file" id="profileAvatarInput" accept="image/*" style="display:none" onchange="handleProfileAvatar(event)">
    <div class="form-group">
      <label>昵称</label>
      <input type="text" id="profileName" placeholder="请输入昵称..." maxlength="20">
    </div>
    <div class="form-group">
      <label>个人简介</label>
      <textarea id="profileBio" placeholder="写点什么介绍自己吧..." style="min-height:60px"></textarea>
    </div>
    <div class="modal-actions">
      <button class="btn btn-ghost" onclick="closeProfile()">取消</button>
      <button class="btn btn-primary" onclick="saveProfile()">保存</button>
    </div>
  </div>
</div>

<!-- CONFIRM DIALOG -->
<div class="confirm-overlay" id="confirmOverlay">
  <div class="confirm-dialog">
    <div class="confirm-icon" id="confirmIcon">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/><line x1="10" y1="11" x2="10" y2="17"/><line x1="14" y1="11" x2="14" y2="17"/></svg>
    </div>
    <h3 id="confirmTitle">确认删除</h3>
    <p id="confirmText">删除后无法恢复，确定要删除吗？</p>
    <div class="confirm-actions">
      <button class="btn btn-ghost" onclick="cancelAction()">取消</button>
      <button class="btn-confirm-delete" id="confirmBtn" onclick="confirmAction()">删除</button>
    </div>
  </div>
</div>

<!-- CATEGORY MANAGE MODAL -->
<div class="modal-overlay" id="catManageOverlay" onclick="closeCatManage(event)">
  <div class="modal" onclick="event.stopPropagation()">
    <div class="modal-header">
      <h2>管理分类</h2>
      <button class="modal-close" onclick="closeCatManage()">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="cat-manage-list" id="catManageList"></div>
    <div class="modal-actions">
      <button class="btn btn-ghost" onclick="addCategoryInline()">+ 新增分类</button>
      <button class="btn btn-primary" onclick="saveCategories()">保存</button>
    </div>
  </div>
</div>

<!-- VIEWERS POPUP -->
<div class="viewers-overlay" id="viewersOverlay" onclick="closeViewers(event)">
  <div class="viewers-dialog" onclick="event.stopPropagation()">
    <div class="modal-header">
      <h2>浏览用户</h2>
      <button class="modal-close" onclick="closeViewers()">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="viewers-list" id="viewersList"></div>
  </div>
</div>

<!-- POST DETAIL + COMMENTS -->
<div class="post-detail-overlay" id="postDetailOverlay" onclick="closePostDetail(event)">
  <div class="post-detail" onclick="event.stopPropagation()">
    <div class="post-detail-header">
      <h2 id="postDetailTitle" style="font-size:16px;font-weight:700"></h2>
      <button class="modal-close" onclick="closePostDetail()">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="post-detail-meta" id="postDetailMeta" style="display:flex;align-items:center;gap:8px;margin-bottom:10px;flex-wrap:wrap"></div>
    <div class="post-detail-body" id="postDetailBody"></div>
    <div class="post-detail-actions" id="postDetailActions"></div>
    <div class="comments-section" id="commentsSection"></div>
  </div>
</div>

<!-- DM (Direct Message) -->
<div class="dm-overlay" id="dmOverlay">
  <div class="dm-dialog">
    <div class="dm-header">
      <h3 id="dmTitle">私信</h3>
      <button class="dm-close" onclick="closeDM()">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
      </button>
    </div>
    <div class="dm-messages" id="dmMessages"></div>
    <div class="dm-input-area">
      <input type="text" class="dm-input" id="dmInput" placeholder="输入消息..." onkeydown="if(event.key==='Enter')sendDM()">
      <button class="dm-send" onclick="sendDM()">发送</button>
    </div>
  </div>
</div>

<!-- USER CARD -->
<div class="user-card-overlay" id="userCardOverlay" onclick="closeUserCard()">
  <div class="user-card" id="userCard"></div>
</div>

<!-- TOAST -->
<div class="toast" id="toast"></div>

<script>
// ===== DATA =====
const avatarColors = [
  'linear-gradient(135deg,#6c5ce7,#a29bfe)',
  'linear-gradient(135deg,#e84393,#fd79a8)',
  'linear-gradient(135deg,#00b894,#00cec9)',
  'linear-gradient(135deg,#e17055,#fdcb6e)',
  'linear-gradient(135deg,#0984e3,#74b9ff)',
  'linear-gradient(135deg,#d63031,#e17055)',
  'linear-gradient(135deg,#00b894,#55efc4)',
  'linear-gradient(135deg,#636e72,#b2bec3)',
  'linear-gradient(135deg,#2d3436,#636e72)',
  'linear-gradient(135deg,#fdcb6e,#f39c12)',
];

const otherUsers = [
  {name:'林小溪',g:1,avatar:null,admin:false,bio:'喜欢建筑与红石',regDate:'2026-06'},
  {name:'CodeMaster',g:2,avatar:null,admin:false,bio:'全职开发，兼职肝服',regDate:'2026-05'},
  {name:'AI探索者',g:3,avatar:null,admin:false,bio:'AI技术爱好者',regDate:'2026-06'},
  {name:'设计达人',g:4,avatar:null,admin:false,bio:'像素画与建筑党',regDate:'2026-07'},
  {name:'全栈工程师',g:5,avatar:null,admin:false,bio:'写代码写到天亮',regDate:'2026-05'},
  {name:'产品经理Lisa',g:6,avatar:null,admin:false,bio:'关注用户体验',regDate:'2026-07'},
  {name:'DevOps老张',g:7,avatar:null,admin:false,bio:'运维大佬',regDate:'2026-06'},
  {name:'安全研究员',g:0,avatar:null,admin:false,bio:'网络安全从业者',regDate:'2026-07'},
];

let currentUser = {name:'',g:0,avatar:null,admin:false,bio:'',regDate:''};
let threadIdCounter = Date.now();

let categories = [
  {id:'all',label:'全部',cls:'tag-server',builtin:true},
  {id:'announce',label:'公告',cls:'tag-announce',builtin:true,adminOnly:true},
  {id:'server',label:'服务器资讯',cls:'tag-server'},
  {id:'guide',label:'新手攻略',cls:'tag-guide'},
  {id:'event',label:'活动',cls:'tag-event'},
  {id:'market',label:'交易集市',cls:'tag-market'},
  {id:'skill',label:'技能讨论',cls:'tag-skill'},
  {id:'chat',label:'闲聊灌水',cls:'tag-chat'},
];

const categoryMap = {};
const categoryStyles = ['tag-server','tag-guide','tag-event','tag-market','tag-skill','tag-chat'];

let threads = [];

let currentFilter = 'all';
let deleteTargetId = null;
let editingThreadId = null;
let actionCallback = null;
let currentDetailThread = null;
let dmTargetUser = null;

// ===== MARKDOWN =====
function mdInsert(before,after){
  const ta=document.getElementById('newContent');
  const s=ta.selectionStart,e=ta.selectionEnd;
  const v=ta.value;
  const sel=v.substring(s,e);
  ta.value=v.substring(0,s)+before+sel+after+v.substring(e);
  ta.focus();
  ta.setSelectionRange(s+before.length,e+before.length);
  updateMdPreview();
}
function switchMdTab(tab,el){
  document.querySelectorAll('.md-tab-btn').forEach(b=>b.classList.remove('active'));
  el.classList.add('active');
  const ta=document.getElementById('newContent');
  const prev=document.getElementById('mdPreview');
  if(tab==='preview'){
    prev.innerHTML=renderMarkdown(ta.value);
    prev.classList.add('active');
    ta.style.display='none';
    document.getElementById('mdToolbar').style.display='none';
  }else{
    prev.classList.remove('active');
    ta.style.display='block';
    document.getElementById('mdToolbar').style.display='flex';
    ta.focus();
  }
}
function updateMdPreview(){
  const ta=document.getElementById('newContent');
  const prev=document.getElementById('mdPreview');
  if(prev.classList.contains('active')) prev.innerHTML=renderMarkdown(ta.value);
}
function renderMarkdown(text){
  if(!text)return'';
  let s=text.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
  s=s.replace(/\*\*(.+?)\*\*/g,'<strong>$1</strong>');
  s=s.replace(/\*(.+?)\*/g,'<em>$1</em>');
  s=s.replace(/~~(.+?)~~/g,'<del>$1</del>');
  s=s.replace(/`(.+?)`/g,'<code>$1</code>');
  s=s.replace(/^### (.+)$/gm,'<h3>$1</h3>');
  s=s.replace(/^## (.+)$/gm,'<h2>$1</h2>');
  s=s.replace(/^# (.+)$/gm,'<h1>$1</h1>');
  s=s.replace(/^> (.+)$/gm,'<blockquote>$1</blockquote>');
  s=s.replace(/^- (.+)$/gm,'<li>$1</li>');
  s=s.replace(/(<li>.*<\/li>\n?)+/g,m=>'<ul>'+m+'</ul>');
  s=s.replace(/^(\d+)\. (.+)$/gm,'<li>$2</li>');
  s=s.replace(/\[([^\]]+)\]\(([^)]+)\)/g,'<a href="$2" target="_blank">$1</a>');
  s=s.replace(/\n---\n/g,'<hr>');
  s=s.replace(/```\n([\s\S]*?)\n```/g,'<pre><code>$1</code></pre>');
  s=s.replace(/\n\n/g,'<p>');
  s=s.replace(/\n/g,'<br>');
  return s;
}

// ===== LOCAL STORAGE =====
function saveToLS(){
  try{
    localStorage.setItem('hm_threads',JSON.stringify(threads));
    localStorage.setItem('hm_categories',JSON.stringify(categories));
    localStorage.setItem('hm_user',JSON.stringify(currentUser));
    localStorage.setItem('hm_tid',threadIdCounter.toString());
  }catch(e){}
}
function loadFromLS(){
  try{
    const t=localStorage.getItem('hm_threads');
    if(t) threads=JSON.parse(t);
    const c=localStorage.getItem('hm_categories');
    if(c){categories=JSON.parse(c);rebuildCategoryMap();}
    const u=localStorage.getItem('hm_user');
    if(u){
      currentUser=JSON.parse(u);
      if(!currentUser.bio) currentUser.bio='';
      if(!currentUser.regDate) currentUser.regDate=new Date().toLocaleDateString('zh-CN',{year:'numeric',month:'2-digit'});
      // migrate other users
      otherUsers.forEach(ou=>{if(!ou.bio)ou.bio='';if(!ou.regDate)ou.regDate='2026-06';});
      threads.forEach(t=>{
        if(!t.content) t.content=t.excerpt;
        if(!t.likes) t.likes=0;
        if(!t.views) t.views=1;
        if(!t.viewers) t.viewers=[];
        if(!t.comments) t.comments=[];
        if(t.liked===undefined) t.liked=false;
      });
      document.getElementById('onboarding').classList.add('hidden');
      document.getElementById('header').style.display='flex';
      document.getElementById('bottomNav').style.display='block';
      document.getElementById('mainWrap').style.display='block';
      document.getElementById('adminBadge').style.display=currentUser.admin?'inline-block':'none';
      updateMyAvatar();
      renderCategories();
      renderThreads();
      renderMyPage();
      updateCategorySelect();
    }
    const tid=localStorage.getItem('hm_tid');
    if(tid) threadIdCounter=parseInt(tid);
  }catch(e){}
}

function rebuildCategoryMap(){
  categoryMap={};
  categories.forEach(c=>{categoryMap[c.id]={label:c.label,cls:c.cls};});
}

// ===== ONBOARDING =====
function handleOnboardAvatar(e){
  const file=e.target.files[0];if(!file)return;
  const reader=new FileReader();
  reader.onload=ev=>{
    currentUser.avatar=ev.target.result;
    document.getElementById('onboardAvatarImg').src=ev.target.result;
    document.getElementById('onboardAvatarUpload').classList.add('has-image');
    checkOnboardReady();
  };
  reader.readAsDataURL(file);
}
function checkOnboardReady(){
  const name=document.getElementById('onboardName').value.trim();
  document.getElementById('onboardBtn').disabled=!(name&&currentUser.avatar);
}
function enterForum(){
  const name=document.getElementById('onboardName').value.trim();
  if(!name||!currentUser.avatar)return;
  currentUser.name=name;
  currentUser.initial=name.charAt(0);
  currentUser.g=Math.floor(Math.random()*avatarColors.length);
  currentUser.admin=(name==='云亦');
  currentUser.regDate=new Date().toLocaleDateString('zh-CN',{year:'numeric',month:'2-digit'});
  document.getElementById('onboarding').classList.add('hidden');
  document.getElementById('header').style.display='flex';
  document.getElementById('bottomNav').style.display='block';
  document.getElementById('mainWrap').style.display='block';
  document.getElementById('adminBadge').style.display=currentUser.admin?'inline-block':'none';
  updateMyAvatar();
  renderCategories();
  renderThreads();
  renderMyPage();
  updateCategorySelect();
  saveToLS();
  showToast('欢迎来到绘梦社区！');
}

// ===== HELPERS =====
function getUser(threadUser){return threadUser>=0?currentUser:otherUsers[Math.abs(threadUser)-1];}
function isAdmin(u){return !!u.admin;}
function getAvatarHTML(u,size){
  const s=size||34;
  const crown=isAdmin(u)?'<div class="admin-crown">👑</div>':'';
  const click=`onclick="showUserCard(event,'${u.name}')"`;
  if(u.avatar) return `<div class="thread-avatar" style="width:${s}px;height:${s}px;font-size:${s*0.38}px" ${click}><img src="${u.avatar}">${crown}</div>`;
  return `<div class="thread-avatar" style="width:${s}px;height:${s}px;font-size:${s*0.38}px;background:${avatarColors[u.g]}" ${click}>${u.initial}${crown}</div>`;
}
function getSmallAvatarHTML(u,sz){
  if(u.avatar) return `<div class="comment-avatar" style="background:transparent"><img src="${u.avatar}"></div>`;
  return `<div class="comment-avatar" style="background:${avatarColors[u.g]}">${u.initial}</div>`;
}

// ===== USER CARD =====
function showUserCard(evt,name){
  evt.stopPropagation();
  const target=name===currentUser.name?currentUser:otherUsers.find(u=>u.name===name);
  if(!target) return;
  const card=document.getElementById('userCard');
  const isSelf=(name===currentUser.name);
  const isAdminUser=isAdmin(target);
  card.innerHTML=`
    <div class="user-card-header">
      ${getAvatarHTML(target,44)}
      <div>
        <div class="user-card-name">${target.name}${isAdminUser?' 👑':''}</div>
        ${isAdminUser?'<span class="admin-badge" style="display:inline-block;font-size:9px">管理员</span>':''}
      </div>
    </div>
    <div class="user-card-bio">${target.bio||'这个人很懒，什么都没写~'}</div>
    <div class="user-card-stats">
      <div class="user-card-stat">注册：<b>${target.regDate||'未知'}</b></div>
    </div>
    <div class="user-card-actions">
      ${!isSelf?`<button class="btn btn-primary" onclick="openDM('${name}')">私信</button>
      <button class="btn btn-ghost" onclick="closeUserCard()">关闭</button>`:'<button class="btn btn-ghost" onclick="closeUserCard()">关闭</button>'}
    </div>
  `;
  // position card near click
  const rect=evt.currentTarget.getBoundingClientRect();
  card.style.top=(rect.bottom+8)+'px';
  card.style.left=Math.min(rect.left,window.innerWidth-290)+'px';
  document.getElementById('userCardOverlay').classList.add('active');
}
function closeUserCard(){
  document.getElementById('userCardOverlay').classList.remove('active');
}

// ===== DIRECT MESSAGE =====
function openDM(name){
  closeUserCard();
  const target=otherUsers.find(u=>u.name===name);
  if(!target) return;
  dmTargetUser=target;
  document.getElementById('dmTitle').textContent='私信 - '+name;
  renderDMMessages();
  document.getElementById('dmOverlay').classList.add('active');
  document.body.style.overflow='hidden';
}
function closeDM(){
  document.getElementById('dmOverlay').classList.remove('active');
  document.body.style.overflow='';
  dmTargetUser=null;
}
function renderDMMessages(){
  const box=document.getElementById('dmMessages');
  if(!dmTargetUser){
    box.innerHTML='<div class="dm-empty">未选择用户</div>';
    return;
  }
  const key='dm_'+[currentUser.name,dmTargetUser.name].sort().join('_');
  let msgs=[];
  try{msgs=JSON.parse(localStorage.getItem(key)||'[]');}catch(e){}
  if(!msgs.length){
    box.innerHTML='<div class="dm-empty">暂无消息，开始对话吧</div>';
    return;
  }
  box.innerHTML=msgs.map(m=>`
    <div class="dm-msg ${m.from===currentUser.name?'sent':'received'}">
      ${m.text}
      <div class="dm-msg-time">${m.time}</div>
    </div>
  `).join('');
  box.scrollTop=box.scrollHeight;
}
function sendDM(){
  if(!dmTargetUser) return;
  const input=document.getElementById('dmInput');
  const text=input.value.trim();
  if(!text) return;
  const key='dm_'+[currentUser.name,dmTargetUser.name].sort().join('_');
  let msgs=[];
  try{msgs=JSON.parse(localStorage.getItem(key)||'[]');}catch(e){}
  msgs.push({from:currentUser.name,text,time:new Date().toLocaleTimeString('zh-CN',{hour:'2-digit',minute:'2-digit'})});
  localStorage.setItem(key,JSON.stringify(msgs));
  input.value='';
  renderDMMessages();
}

// ===== AVATAR CLICK (admin toggle) =====
function onAvatarClick(name){
  if(name===currentUser.name) return;
  const target=otherUsers.find(u=>u.name===name);
  if(!target) return;
  const isNow=isAdmin(target);
  document.getElementById('confirmTitle').textContent=isNow?'撤销管理员权限':'授予管理员权限';
  document.getElementById('confirmText').textContent=`确定要${isNow?'撤销':'授予'}「${name}」的管理员权限吗？`;
  const icon=document.getElementById('confirmIcon');
  icon.className='confirm-icon'+(isNow?'':' grant');
  const btn=document.getElementById('confirmBtn');
  btn.textContent=isNow?'撤销':'授予';
  btn.className=isNow?'btn-confirm-delete':'btn-confirm-grant';
  actionCallback=()=>{
    target.admin=!isNow;
    renderThreads();
    showToast(`${isNow?'撤销':'授予'}「${name}」管理员权限成功`);
    document.getElementById('confirmOverlay').classList.remove('active');
    saveToLS();
  };
  document.getElementById('confirmOverlay').classList.add('active');
}

// ===== RENDER =====
function renderCategories(){
  const c=document.getElementById('categoryTabs');
  let html=categories.map(cat=>{
    const active=cat.id===currentFilter;
    const edit=currentUser.admin&&!cat.builtin?`<button class="cat-edit" onclick="event.stopPropagation();openCatManage()">
      <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
    </button>`:'';
    return `<button class="cat-tab ${active?'active':''}" onclick="filterCategory(this,'${cat.id}')">${cat.label}${edit}</button>`;
  }).join('');
  if(currentUser.admin) html+=`<button class="add-cat-btn" onclick="openCatManage()">+ 管理</button>`;
  c.innerHTML=html;
}

function renderThreads(){
  const list=document.getElementById('threadList');
  let data=currentFilter==='all'?threads:threads.filter(t=>t.category===currentFilter);
  const q=document.getElementById('searchInput').value.toLowerCase().trim();
  if(q){
    data=data.filter(t=>{
      const u=getUser(t.user);
      return t.title.toLowerCase().includes(q)||t.excerpt.toLowerCase().includes(q)||u.name.toLowerCase().includes(q);
    });
  }
  if(!data.length){
    list.innerHTML='<div style="text-align:center;padding:36px;color:var(--text-muted);font-size:13px">暂无帖子</div>';
    updatePagination(0);
    return;
  }
  list.innerHTML=data.map((t,i)=>{
    const u=getUser(t.user);
    const cat=categoryMap[t.category];
    const canDel=currentUser.admin||t.user>=0;
    const canEdit=currentUser.admin||t.user>=0;
    const ac=isAdmin(u)?'thread-author admin':'thread-author';
    const pinnedBadge=t.pinned?'<span class="thread-tag" style="background:rgba(253,203,110,.2);color:#e17055">置顶</span>':'';
    const likedClass=t.liked?'liked':'';
    return `
    <article class="thread-card" style="animation-delay:${i*0.03}s" onclick="openPostDetail(${t.id})">
      ${getAvatarHTML(u,34)}
      <div class="thread-body">
        <div class="thread-meta">
          <span class="${ac}">${u.name}${isAdmin(u)?' 👑':''}</span>
          <span class="thread-time">${t.time}</span>
          ${cat?`<span class="thread-tag ${cat.cls}">${cat.label}</span>`:''}
          ${pinnedBadge}
        </div>
        <h3 class="thread-title"><a href="#" onclick="event.stopPropagation();openPostDetail(${t.id})">${t.title}</a></h3>
        <p class="thread-excerpt">${t.excerpt}</p>
        <div class="thread-footer">
          <span class="thread-stat like-btn ${likedClass}" onclick="event.stopPropagation();toggleLike(${t.id})">
            <svg viewBox="0 0 24 24" fill="${t.liked?'var(--red)':'none'}" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>${t.likes}
          </span>
          <span class="thread-stat" onclick="event.stopPropagation();openPostDetail(${t.id})">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>${t.replies||0}
          </span>
          <span class="thread-stat view-btn" onclick="event.stopPropagation();showViewers(${t.id})">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>${t.viewers?t.viewers.length:0}
          </span>
        </div>
      </div>
      ${(canDel||canEdit)?`<div class="thread-actions" onclick="event.stopPropagation()">
        ${canEdit?`<button class="thread-action-btn edit" onclick="editThread(${t.id})"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg></button>`:''}
        ${canDel?`<button class="thread-action-btn delete" onclick="deleteThread(${t.id})"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>`:''}
      </div>`:''}
    </article>`;
  }).join('');
  updatePagination(data.length);
}

function updatePagination(count){
  const wrap=document.getElementById('pagination');
  wrap.innerHTML='';
  if(count===0) return;
  const pages=Math.min(5,Math.ceil(count/10));
  for(let i=1;i<=pages;i++){
    const b=document.createElement('button');
    b.className='page-btn'+(i===1?' active':'');
    b.textContent=i;
    b.onclick=()=>{document.querySelectorAll('.page-btn').forEach(x=>x.classList.remove('active'));b.classList.add('active');};
    wrap.appendChild(b);
  }
}

// ===== POST DETAIL + COMMENTS =====
function openPostDetail(id){
  const t=threads.find(x=>x.id===id);
  if(!t) return;
  currentDetailThread=t;
  const u=getUser(t.user);
  // increment views
  t.views=(t.views||0)+1;
  // add viewer
  if(!t.viewers) t.viewers=[];
  const viewerEntry={name:currentUser.name,time:new Date().toLocaleTimeString('zh-CN',{hour:'2-digit',minute:'2-digit'})};
  if(!t.viewers.find(v=>v.name===currentUser.name)) t.viewers.push(viewerEntry);
  saveToLS();

  document.getElementById('postDetailTitle').textContent=t.title;
  const cat=categoryMap[t.category];
  document.getElementById('postDetailMeta').innerHTML=`
    ${getAvatarHTML(u,34)}
    <div>
      <div style="font-size:13px;font-weight:600">${u.name}${isAdmin(u)?' 👑':''}</div>
      <div style="font-size:11px;color:var(--text-muted)">${t.time}${cat?' · '+cat.label:''}</div>
    </div>
  `;
  document.getElementById('postDetailBody').innerHTML=renderMarkdown(t.content||t.excerpt);
  const likedClass=t.liked?'liked':'';
  document.getElementById('postDetailActions').innerHTML=`
    <span class="thread-stat like-btn ${likedClass}" onclick="toggleLike(${t.id})">
      <svg viewBox="0 0 24 24" fill="${t.liked?'var(--red)':'none'}" stroke="currentColor" stroke-width="2" style="width:18px;height:18px"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
      <span id="detailLikeCount">${t.likes}</span> 点赞
    </span>
    <span class="thread-stat" style="cursor:default">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:18px;height:18px"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
      ${t.viewers?t.viewers.length:0} 浏览
    </span>
  `;
  renderComments(t);
  document.getElementById('postDetailOverlay').classList.add('active');
  document.body.style.overflow='hidden';
  renderThreads(); // refresh view counts
}
function closePostDetail(e){if(e&&e.target!==e.currentTarget)return;document.getElementById('postDetailOverlay').classList.remove('active');document.body.style.overflow='';currentDetailThread=null;}

function toggleLike(id){
  const t=threads.find(x=>x.id===id);
  if(!t) return;
  t.liked=!t.liked;
  t.likes=(t.likes||0)+(t.liked?1:-1);
  if(t.likes<0) t.likes=0;
  // update detail view if open
  if(currentDetailThread&&currentDetailThread.id===id){
    const el=document.getElementById('detailLikeCount');
    if(el) el.textContent=t.likes;
    const heart=document.querySelector('.post-detail-actions .like-btn');
    if(heart){heart.classList.toggle('liked',t.liked);heart.querySelector('svg').setAttribute('fill',t.liked?'var(--red)':'none');}
  }
  renderThreads();
  saveToLS();
}

// ===== COMMENTS =====
function renderComments(t){
  if(!t.comments) t.comments=[];
  const section=document.getElementById('commentsSection');
  let html=`<div class="comments-title">评论（${t.comments.length}）</div>`;
  if(t.comments.length){
    html+=t.comments.map((c,i)=>{
      const u=getUser(c.user);
      const canDel=(c.user>=0)||currentUser.admin;
      return `
      <div class="comment-item">
        ${getSmallAvatarHTML(u,28)}
        <div class="comment-body">
          <div class="comment-meta">
            <span class="comment-author">${u.name}${isAdmin(u)?' 👑':''}</span>
            <span class="comment-time">${c.time}</span>
          </div>
          <div class="comment-text">${renderMarkdown(c.text)}</div>
        </div>
        ${canDel?`<button class="comment-delete" onclick="deleteComment(${t.id},${i})" title="删除">
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
        </button>`:''}
      </div>`;
    }).join('');
  }
  const canComment=(currentUser.name!=='');
  if(canComment){
    html+=`
    <div class="comment-input-wrap">
      ${getSmallAvatarHTML(currentUser,28)}
      <textarea class="comment-input" id="commentInput" placeholder="写下你的评论..." rows="1"></textarea>
      <button class="comment-submit" onclick="submitComment(${t.id})">发送</button>
    </div>`;
  }
  section.innerHTML=html;
  // auto-resize textarea
  const ta=document.getElementById('commentInput');
  if(ta){ta.addEventListener('input',function(){this.style.height='auto';this.style.height=this.scrollHeight+'px';});}
}
function submitComment(threadId){
  const t=threads.find(x=>x.id===threadId);
  if(!t) return;
  const input=document.getElementById('commentInput');
  const text=input.value.trim();
  if(!text){showToast('请输入评论内容',true);return;}
  if(!t.comments) t.comments=[];
  t.comments.push({
    user:0,text,
    time:new Date().toLocaleTimeString('zh-CN',{hour:'2-digit',minute:'2-digit'})
  });
  t.replies=(t.replies||0)+1;
  input.value='';
  renderComments(t);
  renderThreads();
  saveToLS();
}
function deleteComment(threadId,commentIdx){
  const t=threads.find(x=>x.id===threadId);
  if(!t||!t.comments) return;
  t.comments.splice(commentIdx,1);
  t.replies=Math.max(0,(t.replies||0)-1);
  renderComments(t);
  renderThreads();
  saveToLS();
  showToast('评论已删除');
}

// ===== VIEWERS =====
function showViewers(id){
  const t=threads.find(x=>x.id===id);
  if(!t) return;
  if(!t.viewers||!t.viewers.length){
    document.getElementById('viewersList').innerHTML='<div style="text-align:center;color:var(--text-muted);font-size:12px;padding:20px">暂无浏览记录</div>';
  }else{
    document.getElementById('viewersList').innerHTML=t.viewers.map(v=>{
      const vu=otherUsers.find(u=>u.name===v.name)||currentUser;
      return `<div class="viewer-item">
        ${getSmallAvatarHTML(vu,32)}
        <div class="viewer-item-name">${v.name}</div>
        <div class="viewer-item-time">${v.time||''}</div>
      </div>`;
    }).join('');
  }
  document.getElementById('viewersOverlay').classList.add('active');
}
function closeViewers(e){if(e&&e.target!==e.currentTarget)return;document.getElementById('viewersOverlay').classList.remove('active');}

// ===== POST =====
function openModal(){
  updateCategorySelect();
  if(document.getElementById('newCategory').options.length===0){
    showToast('请先添加分类再发帖',true);return;
  }
  editingThreadId=null;
  document.getElementById('modalTitle').textContent='发布新帖子';
  document.getElementById('modalSubmitBtn').textContent='发布';
  document.getElementById('modalSubmitBtn').onclick=submitThread;
  document.getElementById('newTitle').value='';
  document.getElementById('newContent').value='';
  document.getElementById('mdPreview').classList.remove('active');
  document.getElementById('newContent').style.display='block';
  document.getElementById('mdToolbar').style.display='flex';
  document.querySelectorAll('.md-tab-btn').forEach(b=>b.classList.remove('active'));
  document.querySelectorAll('.md-tab-btn')[0]?.classList.add('active');
  document.getElementById('modalOverlay').classList.add('active');
  document.body.style.overflow='hidden';
}
function closeModal(e){if(e&&e.target!==e.currentTarget)return;document.getElementById('modalOverlay').classList.remove('active');document.body.style.overflow='';editingThreadId=null;}

function submitThread(){
  const title=document.getElementById('newTitle').value.trim();
  const content=document.getElementById('newContent').value.trim();
  const cat=document.getElementById('newCategory').value;
  if(!title){showToast('请输入标题',true);return;}
  if(!content){showToast('请输入内容',true);return;}
  if(!cat){showToast('请选择分类',true);return;}
  const catObj=categories.find(c=>c.id===cat);
  if(catObj&&catObj.adminOnly&&!currentUser.admin){showToast('公告分类仅管理员可用',true);return;}
  threads.unshift({
    id:++threadIdCounter,user:0,category:cat,title,
    excerpt:content.replace(/[#*_~`>\[\]\n\r]/g,'').slice(0,120)+(content.length>120?'...':''),
    content,time:'刚刚',replies:0,likes:0,views:1,viewers:[],comments:[],liked:false
  });
  closeModal();
  renderThreads();
  renderMyPage();
  showToast('发布成功！');
  saveToLS();
}

function editThread(id){
  const t=threads.find(x=>x.id===id);
  if(!t) return;
  editingThreadId=id;
  updateCategorySelect();
  document.getElementById('newTitle').value=t.title;
  document.getElementById('newContent').value=t.content||t.excerpt;
  document.getElementById('newCategory').value=t.category;
  document.getElementById('modalTitle').textContent='编辑帖子';
  document.getElementById('modalSubmitBtn').textContent='保存';
  document.getElementById('modalSubmitBtn').onclick=()=>{
    const title=document.getElementById('newTitle').value.trim();
    const content=document.getElementById('newContent').value.trim();
    const cat=document.getElementById('newCategory').value;
    if(!title){showToast('请输入标题',true);return;}
    t.title=title;
    t.excerpt=content.replace(/[#*_~`>\[\]\n\r]/g,'').slice(0,120)+(content.length>120?'...':'');
    t.content=content;
    t.category=cat;
    closeModal();
    renderThreads();
    renderMyPage();
    showToast('更新成功！');
    saveToLS();
  };
  document.getElementById('modalOverlay').classList.add('active');
  document.body.style.overflow='hidden';
}

// ===== DELETE =====
function deleteThread(id){
  deleteTargetId=id;
  document.getElementById('confirmTitle').textContent='确认删除';
  document.getElementById('confirmText').textContent='删除后无法恢复，确定删除吗？';
  document.getElementById('confirmIcon').className='confirm-icon';
  document.getElementById('confirmBtn').textContent='删除';
  document.getElementById('confirmBtn').className='btn-confirm-delete';
  actionCallback=()=>{
    threads=threads.filter(t=>t.id!==deleteTargetId);
    renderThreads();
    renderMyPage();
    showToast('已删除');
    document.getElementById('confirmOverlay').classList.remove('active');
    saveToLS();
  };
  document.getElementById('confirmOverlay').classList.add('active');
}
function cancelAction(){document.getElementById('confirmOverlay').classList.remove('active');actionCallback=null;}
function confirmAction(){if(actionCallback)actionCallback();}

// ===== CATEGORY MANAGE =====
let tempCategories=[];
function openCatManage(){
  tempCategories=JSON.parse(JSON.stringify(categories));
  renderCatManageList();
  document.getElementById('catManageOverlay').classList.add('active');
  document.body.style.overflow='hidden';
}
function closeCatManage(e){if(e&&e.target!==e.currentTarget)return;document.getElementById('catManageOverlay').classList.remove('active');document.body.style.overflow='';}
function renderCatManageList(){
  const l=document.getElementById('catManageList');
  l.innerHTML=tempCategories.map((c,i)=>`
    <div class="cat-manage-item">
      <span class="tag-preview ${c.cls}">${c.label}</span>
      <input value="${c.label}" ${c.builtin?'readonly style="opacity:.5"':''} onchange="tempCategories[${i}].label=this.value">
      ${!c.builtin?`<button class="cat-manage-btn del" onclick="removeCatInline(${i})"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>`:''}
    </div>`).join('');
}
function addCategoryInline(){
  const id='cat_'+Date.now();
  const cls=categoryStyles[tempCategories.length%categoryStyles.length];
  tempCategories.push({id,label:'新分类',cls,builtin:false});
  renderCatManageList();
}
function removeCatInline(i){if(!tempCategories[i].builtin){tempCategories.splice(i,1);renderCatManageList();}}
function saveCategories(){
  for(const c of tempCategories) if(!c.label.trim()){showToast('分类名不能为空',true);return;}
  const oldIds=categories.map(c=>c.id);
  const newIds=tempCategories.map(c=>c.id);
  const removed=oldIds.filter(x=>!newIds.includes(x));
  if(removed.length){
    threads.forEach(t=>{if(removed.includes(t.category))t.category='chat';});
  }
  categories=tempCategories;
  rebuildCategoryMap();
  renderCategories();
  updateCategorySelect();
  closeCatManage();
  renderThreads();
  showToast('分类已保存');
  saveToLS();
}

// ===== CATEGORY SELECT =====
function updateCategorySelect(){
  const s=document.getElementById('newCategory');
  let items=categories.filter(c=>!c.builtin);
  if(!currentUser.admin) items=items.filter(c=>!c.adminOnly);
  if(!items.length){s.innerHTML='<option disabled>请先添加分类</option>';return;}
  s.innerHTML=items.map(c=>`<option value="${c.id}">${c.label}</option>`).join('');
}

// ===== FILTER =====
function filterCategory(el,id){
  currentFilter=id;
  document.querySelectorAll('.cat-tab').forEach(c=>c.classList.remove('active'));
  el.classList.add('active');
  renderThreads();
}

// ===== PROFILE =====
function handleProfileAvatar(e){
  const file=e.target.files[0];if(!file)return;
  const r=new FileReader();
  r.onload=ev=>{
    currentUser.avatar=ev.target.result;
    document.getElementById('profileAvatarImg').src=ev.target.result;
    document.getElementById('profileAvatarUpload').classList.add('has-image');
  };
  r.readAsDataURL(file);
}
function openProfile(){
  document.getElementById('profileName').value=currentUser.name;
  document.getElementById('profileBio').value=currentUser.bio||'';
  if(currentUser.avatar){
    document.getElementById('profileAvatarImg').src=currentUser.avatar;
    document.getElementById('profileAvatarUpload').classList.add('has-image');
  }
  document.getElementById('profileOverlay').classList.add('active');
  document.body.style.overflow='hidden';
}
function closeProfile(e){if(e&&e.target!==e.currentTarget)return;document.getElementById('profileOverlay').classList.remove('active');document.body.style.overflow='';}
function saveProfile(){
  const name=document.getElementById('profileName').value.trim();
  if(!name){showToast('昵称不能为空',true);return;}
  currentUser.name=name;
  currentUser.initial=name.charAt(0);
  currentUser.bio=document.getElementById('profileBio').value.trim();
  currentUser.admin=(name==='云亦');
  document.getElementById('adminBadge').style.display=currentUser.admin?'inline-block':'none';
  updateMyAvatar();
  renderThreads();
  renderMyPage();
  closeProfile();
  showToast('资料已更新');
  saveToLS();
}

// ===== MY PAGE =====
function renderMyPage(){
  const myPosts=threads.filter(t=>t.user>=0);
  document.getElementById('myPostCount').textContent=myPosts.length;
  // count replies by current user
  let myReplyCount=0;
  threads.forEach(t=>{if(t.comments) t.comments.forEach(c=>{if(c.user>=0)myReplyCount++;});});
  document.getElementById('myReplyCount').textContent=myReplyCount;
  document.getElementById('myRegDate').textContent=currentUser.regDate||'2026-07';
  document.getElementById('myPageName').innerHTML=currentUser.name+(currentUser.admin?' <span class="admin-badge">管理员</span>':'');
  document.getElementById('myPageBio').textContent=currentUser.bio||'这个人很懒，什么都没写~';
  const av=document.getElementById('myPageAvatar');
  if(currentUser.avatar){av.innerHTML=`<img src="${currentUser.avatar}">`;av.style.background='transparent';}
  else{av.style.background=avatarColors[currentUser.g];av.textContent=currentUser.initial;}

  const list=document.getElementById('myThreadList');
  const empty=document.getElementById('myEmpty');
  if(!myPosts.length){
    list.innerHTML='';
    empty.style.display='block';
    return;
  }
  empty.style.display='none';
  list.innerHTML=myPosts.map(t=>{
    const cat=categoryMap[t.category];
    return `
    <article class="thread-card" onclick="openPostDetail(${t.id})">
      <div class="thread-body">
        <div class="thread-meta">
          <span class="thread-time">${t.time}</span>
          ${cat?`<span class="thread-tag ${cat.cls}">${cat.label}</span>`:''}
        </div>
        <h3 class="thread-title"><a href="#" onclick="event.stopPropagation();openPostDetail(${t.id})">${t.title}</a></h3>
        <p class="thread-excerpt">${t.excerpt}</p>
        <div class="thread-footer">
          <span class="thread-stat"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>${t.replies||0}</span>
          <span class="thread-stat"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>${t.likes}</span>
        </div>
      </div>
      <div class="thread-actions" onclick="event.stopPropagation()">
        <button class="thread-action-btn edit" onclick="editThread(${t.id})"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg></button>
        <button class="thread-action-btn delete" onclick="deleteThread(${t.id})"><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg></button>
      </div>
    </article>`;
  }).join('');
}

function updateMyAvatar(){
  const b=document.getElementById('myAvatarBtn');
  if(currentUser.avatar){b.innerHTML=`<img src="${currentUser.avatar}">`;b.style.background='transparent';}
  else{b.style.background=avatarColors[currentUser.g];b.textContent=currentUser.initial;}
}

// ===== NAVIGATION =====
function switchPage(page){
  document.querySelectorAll('.page-content').forEach(p=>p.classList.remove('active'));
  document.querySelectorAll('.nav-item').forEach(n=>n.classList.remove('active'));
  if(page==='community'){
    document.getElementById('pageCommunity').classList.add('active');
    document.getElementById('navCommunity').classList.add('active');
  }else if(page==='my'){
    document.getElementById('pageMy').classList.add('active');
    document.getElementById('navMy').classList.add('active');
    renderMyPage();
  }
}
function goOfficial(){
  window.open('https://hm9178.github.io/h','_blank');
}

// ===== SEARCH =====
document.getElementById('searchInput').addEventListener('input',function(){
  document.querySelectorAll('.page-btn').forEach(b=>b.classList.remove('active'));
  const first=document.querySelector('.page-btn');
  if(first) first.classList.add('active');
  renderThreads();
});

// ===== KEYBOARD =====
document.addEventListener('keydown',e=>{
  if(e.key==='Escape'){
    closeModal();closeProfile();cancelAction();closeCatManage();
    closePostDetail();closeViewers();closeDM();closeUserCard();
  }
  if(e.key==='n'&&(e.ctrlKey||e.metaKey)){e.preventDefault();openModal();}
});

// ===== TOAST =====
function showToast(msg,isErr){
  const t=document.getElementById('toast');
  t.textContent=msg;
  t.className='toast'+(isErr?' error':'');
  t.classList.add('show');
  setTimeout(()=>t.classList.remove('show'),3000);
}

// ===== INIT =====
rebuildCategoryMap();
loadFromLS();
</script>
</body>
</html>
