#include "ImageItem.h"
#include <QPainter>

ImageItem::ImageItem(QQuickItem *parent)
        : QQuickPaintedItem(parent), m_fillMode(Qt::KeepAspectRatio)
{
}

QImage ImageItem::image() const
{
    return m_image;
}

void ImageItem::setImage(const QImage &image)
{
    if (m_image != image) {
        m_image = image;
        emit imageChanged();
        update();
    }
}

Qt::AspectRatioMode ImageItem::fillMode() const
{
    return m_fillMode;
}

void ImageItem::setFillMode(Qt::AspectRatioMode mode)
{
    if (m_fillMode != mode) {
        m_fillMode = mode;
        emit fillModeChanged();
        update();
    }
}

void ImageItem::paint(QPainter *painter)
{
    if (m_image.isNull())
        return;

    QRectF targetRect = boundingRect();

    QRectF sourceRect(0, 0, m_image.width(), m_image.height());
    QPointF sourceCenter = sourceRect.center();
    QPointF targetCenter = targetRect.center();

    // 设置目标 QRectF 的中心点为源 QRectF 的中心点
    targetRect.moveCenter(sourceCenter);

    // 计算缩放比例
    qreal scaleFactor = qMin(targetRect.width() / sourceRect.width(), targetRect.height() / sourceRect.height());

    // 使用 QRectF::center() 设置目标 QRectF 的中心点，按比例缩放
    targetRect.setSize(sourceRect.size() * scaleFactor);

    // 确保目标 QRectF 仍然在目标 QRectF 内
    targetRect.moveCenter(targetCenter);
    painter->setRenderHint(QPainter::SmoothPixmapTransform, true);
    painter->setRenderHint(QPainter::Antialiasing, true);
    painter->drawImage(targetRect, m_image, sourceRect, Qt::AutoColor);

}

void ImageItem::loadImage(const QUrl& url) {
    QString s = url.toLocalFile();
    QImage tmp(s);
    setImage(tmp);
}
