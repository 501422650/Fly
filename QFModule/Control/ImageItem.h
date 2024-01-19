#ifndef IMAGEITEM_H
#define IMAGEITEM_H

#include <QImage>
#include <QObject>
#include <QtQmlIntegration>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickPaintedItem>

class ImageItem : public QQuickPaintedItem
{
Q_OBJECT
    Q_PROPERTY(QImage image READ image WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(Qt::AspectRatioMode fillMode READ fillMode WRITE setFillMode NOTIFY fillModeChanged)
    QML_ELEMENT
    Q_DISABLE_COPY(ImageItem)
public:
    explicit ImageItem(QQuickItem *parent = nullptr);

    QImage image() const;
    void setImage(const QImage &image);

    Qt::AspectRatioMode fillMode() const;
    void setFillMode(Qt::AspectRatioMode mode);

    void paint(QPainter *painter) override;
    Q_INVOKABLE void loadImage(const QUrl& url);
signals:
    void imageChanged();
    void fillModeChanged();

private:
    QImage m_image;
    Qt::AspectRatioMode m_fillMode;
};

#endif // IMAGEITEM_H