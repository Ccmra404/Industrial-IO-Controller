# 制造资料归档

仅归档经过确认、能够追溯到具体硬件版本的制造资料。

建议结构：

```text
manufacturing/
└── HW-x.y/
    ├── README.md
    ├── BOM/
    ├── Gerber/
    ├── Drill/
    ├── PickAndPlace/
    └── Assembly/
```

每个版本的 README 至少记录：

- 对应硬件版本及 EDA 工程提交。
- EDA 软件版本和资料导出日期。
- BOM 版本、替代料说明和关键器件备注。
- Gerber/钻孔/坐标文件的用途与单位。
- 生产前检查结果及尚未解决的问题。

不要将未经审核的导出文件标记为正式生产资料。
